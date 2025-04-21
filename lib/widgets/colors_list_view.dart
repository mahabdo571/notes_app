import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currntIndex = 0;
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
                  BlocProvider.of<AddNoteCubit>(context).color = kNoteColors[i];
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
