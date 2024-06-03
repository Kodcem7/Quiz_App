import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.nextPage, this.answerQuestion, {super.key});

  final String answerQuestion;
  final void Function() nextPage;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: nextPage,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40,),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),)
        ),
        child: Text(answerQuestion, textAlign: TextAlign.center,));
  }
}
