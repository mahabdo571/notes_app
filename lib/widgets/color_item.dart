import 'package:flutter/material.dart';
import '../constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
          backgroundColor: kSelectedBorderColor,
          radius: 32,
          child: CircleAvatar(backgroundColor: color, radius: 28),
        )
        : CircleAvatar(backgroundColor: color, radius: 32);
  }
}
