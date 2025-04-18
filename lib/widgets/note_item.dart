import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffffcc80),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'flutter note',
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            subtitle: Text(
              'ddddd sdss dsddddd',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black.withValues(alpha: .4),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.trash, color: Colors.black, size: 30),
            ),
          ),
          Text('12/2/2000', style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
