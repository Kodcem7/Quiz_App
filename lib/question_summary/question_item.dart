import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary/summary_text_style.dart';
import 'package:quiz_app/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              children: [
                Text(
                  ((itemData['question_index'] as int) + 1).toString(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SummaryTextStyle(itemData['question'] as String),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        itemData['user_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 150, 146, 146),
                        ),
                      ),
                      Text(
                        itemData['correct_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 72, 125, 218),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
