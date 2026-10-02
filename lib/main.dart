import 'package:flutter/material.dart';
import 'package:hello/hello.dart';

// 1. The Entry Point
void main() {
  runApp(const MyApp());
}

// 2. The Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloApp()
    );
  }
}