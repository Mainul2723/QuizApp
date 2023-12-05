import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.question_answer, // Replace with your desired icon
                    color: Colors.white, // Set the icon color
                  ),
                  const SizedBox(
                    width: 10, // Add some spacing between the icon and text
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Text(
                            (data['user_ans'] as String),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                          ),
                          child: Text(
                            data['correct_ans'] as String,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
