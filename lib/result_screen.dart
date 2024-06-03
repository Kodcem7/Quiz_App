import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.restart,
  });
  final void Function() restart;
  final List<String> chosenAnswers;

// get that we use in here allow us to use summaryData a
// defined variable also we can use as method

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final x = questions.length;
    final y = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $y out of $x questions correctly!',
            style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 233, 227, 227),
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: restart,
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
