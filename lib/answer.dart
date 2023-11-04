import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.ansText, required this.onTap});
  final String ansText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: Colors.red[400],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      onPressed: onTap,
      child: Text(ansText),
    );
  }
}
