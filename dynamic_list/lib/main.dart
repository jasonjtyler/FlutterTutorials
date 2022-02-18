import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suck It, Jason',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'growable list app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _textController = TextEditingController();

  final List<String> userInput = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              //Text Display
              Expanded(
                  child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userInput.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                      height: 20,
                      child: Center(
                        child: Text(
                          userInput[index],
                        ),
                      ),
                    );
                  },
                ),
              )),

              // Text Input
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter text here'),
              ),

              //Submit button
              MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      userInput.add(_textController.text);
                    },
                  );
                },
                color: Colors.blue,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
