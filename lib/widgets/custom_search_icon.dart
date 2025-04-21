import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onClick});
  final IconData icon;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: onClick,
        
        icon:  Icon(icon, size: 28)),
    );
  }
}
