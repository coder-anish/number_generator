import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Random Number Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool _reveal, _end;
  final Random rand = Random();
  late int? _randomA, _randomB;
  late int _score, _correct, _incorrect, iteration;

  @override
  void initState() {
    _score = 0;
    _correct = 0;
    _incorrect = 0;
    iteration = 0;
    _reveal = false;
    _end = false;
    _randomA = _randomB = null;
    generateRandoms();
    if (super.mounted) return;
    super.initState();
  }

  bool checkResult() => _randomA! > _randomB!;

  void saveGuess(int choice) {
    if (_end) return;
    _reveal = true;
    Future.delayed(const Duration(seconds: 1), (() {
      setState(() {
        _reveal = false;
        generateRandoms();
      });
    }));

    if (choice == 1 && checkResult()) {
      _correct++;
      _score++;
    } else {
      _incorrect++;
    }
  }

  void generateRandoms() {
    iteration++;
    _randomA = rand.nextInt(10) + 1;
    _randomB = rand.nextInt(10) + 1;
    while (_randomA == _randomB) {
      _randomA = rand.nextInt(10) + 1;
      _randomB = rand.nextInt(10) + 1;
    }
    if (iteration > 10) {
      _end = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        
      ),
      // backgroundColor: Color(0xFF111111),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "CHOOSE YOUR SIDE!",
                style: TextStyle(
                  color: Color.fromARGB(221, 0, 0, 0),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    onTap: (() {
                      if (_reveal) return;
                      setState(() {
                        saveGuess(1);
                      });
                    }),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 160,
                      decoration: BoxDecoration(
                          color: _reveal
                              ? checkResult()
                                  ? Colors.green
                                  : Colors.red
                              : const Color.fromARGB(255, 255, 139, 7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                          text: _reveal || _end ? _randomA.toString() : "?",
                          style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    onTap: () {
                      if (_reveal) return;
                      setState(() {
                        saveGuess(2);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 160,
                      decoration: BoxDecoration(
                          color: _reveal
                              ? !checkResult()
                                  ? Colors.green
                                  : Colors.red
                              : const Color.fromARGB(255, 255, 127, 7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                          text: _reveal || _end ? _randomB.toString() : "?",
                          style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  height: 160,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(137, 0, 0, 0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: _end ? "Score - $_score" : "Round $iteration",
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "INCORRECT\n$_incorrect",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "CORRECT\n$_correct",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: _end
                                ? _correct > _incorrect
                                    ? "You Won!"
                                    : "You Lost!"
                                : "",
                            style: TextStyle(
                              fontSize: 30,
                              color: _correct > _incorrect
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: _end
                              ? ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      initState();
                                    });
                                  },
                                  child: RichText(
                                    text: const TextSpan(
                                      text: "Play Again",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
