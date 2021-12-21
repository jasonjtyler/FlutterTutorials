import 'package:flutter/material.dart';

//project for a dynamic list. Basically just a list with a button, press the button and it adds another item to the list.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // I'm commenting out the below text because I don't really know what it does.
  // ^^It's an optional parameter to the constructor and recommonded as of Dart 2.8.0 -JJT
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// I put this here to instantiate the user input so there is a place to store that data
// class userInput {
//   final String? name;
//   final int? age;

//
// }

//I think I fucked up. since I made it receive 2 data points, a Map would probably have been a better choice...  But since I'm creating a List, I will concatenate the entries
late List<String?> userInputlist;

class HomePage extends StatefulWidget {
  // I'm commenting out the below text because I don't really know what it does.
  // ^^It's an optional parameter to the constructor and recommonded as of Dart 2.8.0 -JJT
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  final List<String> _listItems = ['Item 1', 'Item 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pointless app bar'),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(onPressed: _onAddButtonPressed, child: const Text('Add')),
          Expanded(child: ListView.builder(
            itemCount: _listItems.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(_listItems[index]));
            }
          ))
        ],)),
      );
  }

  void _onAddButtonPressed() {
    //Wrap the add within setState so that the UI will be updated.
    //setState causes the build method to be recalled.
    setState(() {
      _listItems.add('Item ' + (_listItems.length + 1).toString());
    });
  }
  
}
