import 'package:flutter/material.dart';

class SummaryTextStyle extends StatelessWidget {
  const SummaryTextStyle(this.summaryText, {super.key});

  final String summaryText;

  @override
  Widget build(BuildContext context) {
    return Text(
      summaryText,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
