import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onClick,
  });
  final String title;
  final IconData icon;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 28)),
        Spacer(),
        CustomIcon(icon: icon, onClick: onClick),
      ],
    );
  }
}
