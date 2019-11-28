import 'note.dart';

abstract class NotesState {
  const NotesState();

}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<Note> notes;
  final bool anySelected;

  const NotesLoaded([this.notes = const[], this.anySelected = false]);
}

class NotesNotLoaded extends NotesState {}