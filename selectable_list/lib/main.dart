import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notes_list.dart';
import 'notes_bloc.dart';

void main() => runApp(BlocProvider(create: (context) => NotesBloc(), child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
         appBar: AppBar(title: const Text('Selectable List')),
         body: NotesList(),
      )
    );
  }
}
