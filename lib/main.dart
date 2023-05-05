import 'package:flutter/material.dart';
import 'app_question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppQuestion appQuestion = AppQuestion();

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          title: const Padding(
            padding: EdgeInsets.only(left: 190),
            child: Text(
              'Exam',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
          ),
        ),
        body: const ExamPage(),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];

  int rightAnswer = 0;

  void checkAnswer(bool userChoice) {
    bool correctAnswer = appQuestion.getQuestionAnswe();
    setState(() {
      if (userChoice == correctAnswer) {
        rightAnswer++;
        answerResult.add(
          const Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
      } else {
        answerResult.add(
          const Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (appQuestion.examEnd() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: 'End Exam',
          desc: 'the right answers $rightAnswer from 7',
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 125,
              child: const Text(
                'Play again',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ).show();

        appQuestion.restExam();

        answerResult = [];

        rightAnswer = 0;
      } else {
        appQuestion.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 100, 3),
          child: Row(
            children: answerResult,
          ),
        ),
        Expanded(
          flex: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 8),
                child: Image.asset(
                  appQuestion.getQuestionImage(),
                ),
              ),
              Text(
                appQuestion.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Expanded(
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: const Text(
                'صح',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Expanded(
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              child: const Text(
                'خطأ',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
