import 'package:flutter/material.dart';

class HelloApp extends StatefulWidget {
  const HelloApp({super.key});

  @override
  State<HelloApp> createState() => _HelloAppState();
}

class _HelloAppState extends State<HelloApp> {
  final TextEditingController _nameInputController = TextEditingController();
  String name = '';

  @override
  void dispose() {
    _nameInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello!'),

            const SizedBox(height: 30,),

            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: TextField(
                controller: _nameInputController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                )
              )
            ),

            const SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = _nameInputController.text;
                });
              },
              child: const Text('Hello'),
            ),

            const SizedBox(height: 20),

            Text(
              name.isEmpty ? '' : 'Hello, $name!',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        )
      ),
    );
  }
}