import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constants.dart';
import '../../models/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);

    notes = noteBox.values.toList();

    emit(NotesSuccess());
  }

  void searchNotes(String query) {
    var noteBox = Hive.box<NoteModel>(kNoteBox);

    final allNotes = noteBox.values.toList();

    notes =
        allNotes
            .where(
              (note) =>
                  note.title.toLowerCase().contains(query.toLowerCase()) ||
                  note.subTitle.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    emit(NotesSuccess());
  }
}
