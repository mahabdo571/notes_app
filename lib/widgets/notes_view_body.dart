import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearching = false;
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  void initState() {
    context.read<NotesCubit>().fetchAllNotes();
    super.initState();

    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus && isSearching) {
        // إذا فقد التركيز نرجع للوضع الطبيعي
        setState(() {
          isSearching = false;
          searchController.clear();
          context.read<NotesCubit>().fetchAllNotes(); // نرجع القائمة الأصلية
        });
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 50),
          isSearching
              ? TextField(
                controller: searchController,
                focusNode: searchFocusNode,
                autofocus: true,
                onChanged: (value) {
                  context.read<NotesCubit>().searchNotes(value);
                },
                decoration: InputDecoration(
                  hintText: 'بحث...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        searchController.clear();
                        context.read<NotesCubit>().fetchAllNotes();
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
              : CustomAppBar(
                title: 'ملاحظاتي',
                icon: Icons.search,
                onClick: () {
                  setState(() {
                    isSearching = true;
                  });
                },
              ),

          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
