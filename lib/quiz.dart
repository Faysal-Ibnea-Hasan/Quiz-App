import 'package:flutter/material.dart';
import 'package:quiz_app/data/qs.dart';
import 'package:quiz_app/qs_screen.dart';
import 'package:quiz_app/result_screen.dart';

import 'package:quiz_app/welcome_text.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
 List<String> selectedAns = [];
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = WelcomeText(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QsScreen(onSelectAns: chooseAns,);
    });
  }
  void restartQuiz() {
    setState(() {
      selectedAns = [];
      activeScreen = QsScreen(onSelectAns: chooseAns);
    });
  }
  
  void chooseAns(String answer){
    selectedAns.add(answer);

    if(selectedAns.length == qs.length){
      setState(() {
        
        activeScreen =  ResultScreen(choosenAns: selectedAns,onRestart: restartQuiz);
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeText(switchScreen);
    if (activeScreen ==  QsScreen(onSelectAns: chooseAns,)) {
      screenWidget =  QsScreen(onSelectAns: chooseAns,);
    }
    if(activeScreen == ResultScreen(choosenAns: selectedAns,onRestart: restartQuiz,)){
        screenWidget = ResultScreen(choosenAns: selectedAns,onRestart: restartQuiz,);
    }
    if (activeScreen == ResultScreen(choosenAns: selectedAns,onRestart: restartQuiz)) {
      screenWidget = ResultScreen(
        choosenAns: selectedAns,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.amberAccent,
            Color.fromARGB(255, 236, 190, 24)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
