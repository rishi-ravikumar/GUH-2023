import 'package:flutter/material.dart';
import 'homepage.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        ListTile(
          title: Text('Quiz 1'),
          onTap: () {
            quizBrain.setQuizNo(1);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
          },
        ),
        ListTile(
          title: Text('Quiz 2'),
          onTap: () {
            quizBrain.setQuizNo(2);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
          },
        ),
        ListTile(
          title: Text('Quiz 3'),
          onTap: () {
            quizBrain.setQuizNo(3);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
          },
        ),
      ],
    ));
  }
}
