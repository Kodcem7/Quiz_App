import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuizLayout extends StatelessWidget {
  const StartQuizLayout(this.startQuiz, {super.key});

  final void Function() startQuiz;

  final myQuizImage = 'assets/images/quiz-logo.png';
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            myQuizImage,
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     myQuizImage,
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 70,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.oswald(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
