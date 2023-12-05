import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var actvScrn = 'start_screen';

  void switchScreen() {
    setState(() {
      actvScrn = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == question.length) {
      setState(() {
        actvScrn = 'result_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer.clear(); // Clear the selected answers
      actvScrn = 'start_screen'; // Reset the screen to the start screen
    });
  }

  @override
  Widget build(context) {
    Widget setScreen = StartScreen(switchScreen);
    if (actvScrn == 'question_screen') {
      setScreen = QuestionScreen(
        selectAnswer: chooseAnswer,
      );
    }
    if (actvScrn == 'result_screen') {
      setScreen = ResultScreen(
        choosenAnswer: selectedAnswer,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 59, 0, 222),
                Color.fromARGB(255, 115, 24, 180),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: setScreen,
        ),
      ),
    );
  }
}
