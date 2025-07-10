import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
class CustomPaginatorButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;

  const CustomPaginatorButton({
    required this.onTap,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          child: Text(text,textAlign: TextAlign.center,),
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
            shape: CircleBorder()),

          ),
        ),

    );
  }
}