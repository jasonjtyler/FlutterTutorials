import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Placeholder(),
    );
  }
}

class Placeholder extends StatelessWidget {
  const Placeholder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text('Replace me with a button and dynamic list');
  }
  
}