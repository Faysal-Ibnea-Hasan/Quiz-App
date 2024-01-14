import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ans_btn.dart';
import 'package:quiz_app/data/qs.dart';

class QsScreen extends StatefulWidget {
  const QsScreen({super.key, required this.onSelectAns});
  final void Function(String answer) onSelectAns;
  @override
  State<QsScreen> createState() {
    return _QsScreenState();
  }
}

class _QsScreenState extends State<QsScreen> {
  var currentIndex = 0;
  void answerQs(String selectedAns) {
    widget.onSelectAns(selectedAns);
    //currentIndex = currentIndex + 1;
    //currentIndex += 1;
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQs = qs[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQs.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQs.getShuffledAnswer().map((answer) {
              return AnsBtn(answer, () {
                answerQs(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
