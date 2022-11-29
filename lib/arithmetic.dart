import 'package:flutter/material.dart';

class ArithmeticScreen extends StatefulWidget {
  const ArithmeticScreen({super.key});

  @override
  State<ArithmeticScreen> createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {

  void _add() {
    setState(() {
      result = int.parse(_firstController.text) + int.parse(_secondController.text);

    });
  }
  final _firstController = TextEditingController(text: '1');
  final _secondController = TextEditingController();
  int result = 0;
  final  _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add two numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter first no.'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _secondController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter second no.'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter second number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()){}
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Sum is: $result',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ], //Children
          ),
        ),
      ),
    );
  }
}





// const makes the variable constant for compile-time
// final makes variable immutable for whole runtime
// Stateless Widget doesn't let you alter or change anything by redrawing
// super.key -> is used to track the changes in the screen
