import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.setDisplay, {super.key});
  final void Function() setDisplay;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Let' 's Start the Quiz',
            style: GoogleFonts.lato(
              fontSize: 21,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              setDisplay();
            },
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
