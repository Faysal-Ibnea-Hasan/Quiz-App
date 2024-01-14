import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(178, 255, 255, 255),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            'Welcome to the quiz app',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: OutlinedButton.icon(
              onPressed:startQuiz,
              icon: const Icon(Icons.arrow_forward),
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28)),
              label: const Text(
                'Start Quiz',
              )),
        )
      ],
    );
  }
}
