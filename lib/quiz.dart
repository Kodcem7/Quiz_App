import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/layout.dart';
import 'package:quiz_app/question_screen.dart.dart';
import 'package:quiz_app/result_screen.dart';

const topAlignment = Alignment.topCenter;
const bottomAlignment = Alignment.bottomCenter;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartQuizLayout(changeScreen);
  //   super.initState();
  // }

  // void changeScreen() {
  //   setState(() {
  //     activeScreen = QuestionScreen();
  //   });
  // }
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    // final widgetScreen = activeScreen == 'start-screen'
    //             ? StartQuizLayout(changeScreen)
    //             : const QuestionScreen();
    Widget widgetScreen = StartQuizLayout(changeScreen);
    if (activeScreen == 'question-screen') {
      widgetScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      widgetScreen = ResultScreen(
        restart: restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 52, 4, 120),
              Color.fromARGB(255, 97, 4, 131)
            ], begin: topAlignment, end: bottomAlignment),
          ),
          child: Center(
            child: widgetScreen,
          ),
        ),
      ),
    );
  }
}
