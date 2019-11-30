import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notes_bloc.dart';
import 'notes_state.dart';
import 'notes_event.dart';

class NotesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return const Text('Loading...');
        } else if (state is NotesLoaded) {
          var notes = state.notes;
          return Column(children: <Widget>[
            state.anySelected ? const Text('Items Selected!') : const Text('Nothing selected'), 
            ListView.builder(
            shrinkWrap: true,
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              final note = notes[index];
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10), 
                  child: Row(children: <Widget>[
                    GestureDetector(
                      onTap:() { 
                        note.isSelected = !note.isSelected;
                        BlocProvider.of<NotesBloc>(context).add(UpdateNote(note));
                      },
                      child: note.isSelected ? Icon(Icons.check_circle): Icon(Icons.check_circle_outline)
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0), child: Text(note.item.text))
                  ])
                )
              );
            }
          )]);
        } else {
          return const Text('Unknown state.');
        }
      }
    );
  }
}