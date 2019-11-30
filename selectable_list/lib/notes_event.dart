import 'note.dart';
import 'list_item.dart';

abstract class NotesEvent {
  const NotesEvent();
}

class LoadNotes extends NotesEvent {}

class AddNote extends NotesEvent {
  final ListItem<Note> note;

  const AddNote(this.note);
}

class UpdateNote extends NotesEvent {
  final ListItem<Note> updatedNote;

  const UpdateNote(this.updatedNote);
}

class DeleteNote extends NotesEvent {
  final ListItem<Note> note;

  const DeleteNote(this.note);
}

class ToggleAll extends NotesEvent {}