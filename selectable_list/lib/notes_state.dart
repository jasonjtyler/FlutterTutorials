import 'note.dart';

abstract class NotesState {
  const NotesState();

}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<Note> notes;

  const NotesLoaded([this.notes = const[]]);
}

class NotesNotLoaded extends NotesState {}