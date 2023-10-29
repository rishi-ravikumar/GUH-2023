import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'navbar.dart';
import 'globals.dart';

String titletxt = "Available points: " + points.toString();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: Navbar(),
          appBar: AppBar(
            title: Text(titletxt),
          ),
          body: Column(
            children: [
              TabBar(tabs: [
                Tab(icon: Icon(Icons.home, color: Colors.deepPurple)),
                Tab(icon: Icon(Icons.local_movies, color: Colors.deepPurple)),
                Tab(icon: Icon(Icons.videogame_asset, color: Colors.deepPurple))
              ]),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  child: Center(
                    child: QuizPage(),
                  ),
                ),
                Container(
                  child: Center(
                    child: YoutubeScreen(),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Gaming'),
                  ),
                ),
              ]))
            ],
          )),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int score = 0;

  void checkAnswer({required bool userPickedAnswer}) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'You\'ve reached the end of the quiz, and you have a score of ${score}.',
        ).show();
        points += score;
        titletxt = "Available points: " + points.toString();
        quizBrain.reset();
        scoreKeeper.clear();
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      } else {
        if (correctAnswer == userPickedAnswer) {
          quizBrain.nextQuestion();
          score += 1;
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          quizBrain.nextQuestion();
          score -= 1;
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222222),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    // the user picked true.
                    checkAnswer(userPickedAnswer: true);
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    // the user picked false.
                    checkAnswer(userPickedAnswer: false);
                  },
                  child: const Text(
                    'False',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(children: scoreKeeper),
          ],
        ),
      ),
    );
  }
}

QuizBrain quizBrain = QuizBrain();
