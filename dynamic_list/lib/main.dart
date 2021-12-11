// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

//project for a dynamic list. Basically just a list with a button, press the button and it adds another item to the list.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // I'm commenting out the below text because I don't really know what it does.
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// I put this here to instatiate the user input so there is a place to store that data
class userInput {
  final String? name;
  final int? age;

  userInput({this.name, this.age});
}


void inputconcat() {
  final nameController = TextEditingController;
  final ageController = TextEditingController;
}

//I think I fucked up. since we're receiving 2 data points, a Map would probably have been a better choice... But since I'm creating a List, I will concatenate the entries
late List<userInput?> userInputlist;

class HomePage extends StatelessWidget {
  // I'm commenting out the below text because I don't really know what it does.
  //const Placeholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pointless app bar'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .8,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Enter Name"),
                controller: (nameController),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Enter Age"),
                controller: (ageController),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
