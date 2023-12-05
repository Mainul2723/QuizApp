import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswer,
    required this.restartQuiz,
  });

  final List<String> choosenAnswer;
  final VoidCallback restartQuiz;
  //fetching the answers
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].qus,
        'correct_ans': question[i].answers[0],
        'user_ans': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = question.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_ans'] == data['correct_ans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You Answer $numCorrectQuestion out of $numTotalQuestion question Correctly',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // Set the background color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Set the border radius
                ),
              ),
              child: Text(
                'Restart the Quiz',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
