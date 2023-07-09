import 'package:flutter/material.dart';

class TypoButton extends StatelessWidget {
  final String text;
  final double height;
  final Color color;
  const TypoButton(
      {super.key,
      required this.text,
      required this.height,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        onPressed: null,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }
}
