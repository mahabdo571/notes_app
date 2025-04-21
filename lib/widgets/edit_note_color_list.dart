import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import 'color_item.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currntIndex;
  @override
  void initState() {
    currntIndex = kNoteColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemCount: kNoteColors.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currntIndex = i;
                  widget.note.color = kNoteColors[i].toARGB32();
                });
              },

              child: ColorItem(
                color: kNoteColors[i],
                isActive: currntIndex == i,
              ),
            ),
          );
        },
      ),
    );
  }
}
