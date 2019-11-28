import 'package:bloc/bloc.dart';

import 'notes_state.dart';
import 'notes_event.dart';
import 'note.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  static List<Note> notes = [
    Note(1, 'Hello'),
    Note(2, 'World')
  ];

  @override
  NotesState get initialState => NotesLoaded(notes);

  @override
  Stream<NotesState> mapEventToState(NotesEvent event) async* {
    if (event is LoadNotes)
      yield* _mapLoadNotesToState();
    else if (event is AddNote)
      yield* _mapAddNoteToState(event);
    else if (event is UpdateNote)
      yield* _mapUpdateNoteToState(event);
    else if (event is DeleteNote)
      yield* _mapDeleteNoteToState(event);
    else if (event is ToggleAll)
      yield* _mapToggleAllToState(event);
  }

  Stream<NotesState> _mapLoadNotesToState() async* {
    yield NotesLoaded(new List<Note>());
  }

  Stream<NotesState> _mapAddNoteToState(AddNote event) async* {
    final List<Note> loadedNotes = List.from((state as NotesLoaded).notes)
      ..add(event.note);

    yield NotesLoaded(loadedNotes);
  }

  Stream<NotesState> _mapUpdateNoteToState(UpdateNote event) async* {
    final List<Note> updatedNotes = List.from((state as NotesLoaded).notes)
      ..map((x) => x.id == event.updatedNote.id ? event.updatedNote : x);

    yield NotesLoaded(updatedNotes, _anyNotesSelected(updatedNotes));
  }

  Stream<NotesState> _mapDeleteNoteToState(DeleteNote event) async* {
    final List<Note> updatedNotes = List.from((state as NotesLoaded).notes)
      ..where((x) => x.id != event.note.id);
    
    yield NotesLoaded(updatedNotes);
  }
  
  Stream<NotesState> _mapToggleAllToState(ToggleAll event) async* {
    //TODO Add a state to toggle
    final List<Note> updatedNotes = List.from((state as NotesLoaded).notes);

    yield NotesLoaded(updatedNotes);
  }

  bool _anyNotesSelected(List<Note> notes) {
    return notes.where((x) => x.isSelected).length > 0;
  }

}