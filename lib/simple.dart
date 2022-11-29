import 'package:flutter/material.dart';

class SimpleScreen extends StatefulWidget {
  const SimpleScreen({super.key});

  @override
  State<SimpleScreen> createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  int principal = 0, time = 0, rate = 0;
  int interest = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest'),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                principal = int.parse(value);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter principal amount'),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              onChanged: (value) {
                time = int.parse(value);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter time in years'),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              onChanged: (value) {
                rate = int.parse(value);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter rate in percentage'),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    interest = principal * rate * time;
                  });
                },
                child: const Text(
                  'Calculate Interest',
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
              'Interest is: $interest',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ], //Children
        ),
      ),
    );
  }
}
