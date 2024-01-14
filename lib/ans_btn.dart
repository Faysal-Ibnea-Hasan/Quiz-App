import 'package:flutter/material.dart';

class AnsBtn extends StatelessWidget {
  const AnsBtn(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.lightGreenAccent,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
        child: Text(answerText,textAlign: TextAlign.center,));
  }
}
