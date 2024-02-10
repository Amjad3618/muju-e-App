import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String title;
  Button({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        title,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
