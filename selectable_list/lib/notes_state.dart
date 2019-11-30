import 'note.dart';
import 'list_item.dart';

abstract class NotesState {
  const NotesState();

}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<ListItem<Note>> notes;
  final bool anySelected;

  const NotesLoaded([this.notes = const[], this.anySelected = false]);
}

class NotesNotLoaded extends NotesState {}