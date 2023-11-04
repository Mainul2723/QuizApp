import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectAnswer});
  final void Function(String answer) selectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQusIndex = 0;

  void ansQus(String selectedAnswer) {
    widget.selectAnswer(selectedAnswer);
    setState(() {
      currentQusIndex++;
    });
  }

  @override
  Widget build(context) {
    final qus = question[currentQusIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              qus.qus,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...qus.getSuffledAnswers().map((answer) {
              return Answer(
                  ansText: answer,
                  onTap: () {
                    ansQus(answer);
                  });
            }),
          ],
        ),
      ),
    );
    //);
  }
}
