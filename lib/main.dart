import 'package:anish_basic/arithmetic.dart';
import 'package:anish_basic/number_generator.dart';
import 'package:anish_basic/simple.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter for class',
      home: MyApp(),
      
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("Khelauna"),
          centerTitle: true,
          elevation: 0,
        ),
        body:Padding(
          padding: const EdgeInsets.all(9),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.red, width:5 ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              labelText: 'Enter Name Please',
            )
          ),
        )
      );
  }
}