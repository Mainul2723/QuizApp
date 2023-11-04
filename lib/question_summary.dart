import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                children: [
                  const Icon(
                    Icons.question_answer, // Replace with your desired icon
                    color: Colors.black, // Set the icon color
                  ),
                  const SizedBox(
                    width: 8.0, // Add some spacing between the icon and text
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            color: Colors.green,
                            child: Text((data['user_ans'] as String))),
                        Container(
                            color: Colors.red,
                            child: Text(data['correct_ans'] as String)),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
