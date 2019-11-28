import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notes_state.dart';
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
      home: NotesList(),
    );
  }
}

class NotesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return const Text('Loading...');
        } else if (state is NotesLoaded) {
          var notes = state.notes;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              final note = notes[index];
              return Text(note.text);
            }
          );
        } else {
          return const Text('Fuck off.');
        }
      }
    );
  }

}
