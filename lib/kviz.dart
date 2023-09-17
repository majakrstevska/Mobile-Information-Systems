import 'package:flutter/material.dart';

void main() {
  runApp(CustomQuizApp());
}

class CustomQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Квиз',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;

  final List<Map<String, Object>> questions = [
    {
      'question': 'Неотворена кутија стои на подот. Што има внатре?',
      'answers': [
        {
          'answerText':
              'Вашиот одговор открива како гледате на неочекувана ситуација. Ако сте замислиле нешто што нема вредност за вас, тогаш верувате дека среќата и добрите работи не доаѓаат лесно и дека вие не сте предодредени за нив.',
          'score': 1,
        },
        {
          'answerText':
              'Ако сте замислиле некое богатство или нешто вредно, тогаш верувате дека еден ден ќе бидете богати.',
          'score': 2,
        },
        {
          'answerText':
              'Ако претпоставивте дека кутијата е празна, тогаш не верувате во среќа и премногу сте практични и реални.',
          'score': 3,
        },
      ],
    },
    {
      'question':
          'Кога би можеле да изберете едно место на кое ќе го поминете остатокот од животот каде би било тоа?',
      'answers': [
        {
          'answerText':
              'Доколку се одлучивте за местото каде што веќе живеете тогаш сте задоволни и удобно ви е таму каде што сте.',
          'score': 1,
        },
        {
          'answerText':
              'Ако избравте некое далечно место, вие сте сонувач и сакате романтични работи.',
          'score': 2,
        },
        {
          'answerText':
              'Ако не можете да се одлучите тогаш не сте склони кон верност и не се приврзувате за луѓе и места.',
          'score': 3,
        },
      ],
    },
  ];

  int totalScore = 0;

  void _answerQuestion(int score) {
    totalScore += score;

    setState(() {
      currentQuestion++;
    });

    if (currentQuestion < questions.length) {
      // Continue to the next question
    } else {
      // Display answers and results
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Одговори'),
          content: Text(getResults(totalScore)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Затвори го квизот'),
            ),
          ],
        ),
      );
    }
  }

  String getResults(int score) {
    // Add logic to determine the results based on the total score
    if (score <= 5) {
      return 'Your result: Low score';
    } else if (score <= 10) {
      return 'Your result: Moderate score';
    } else {
      return 'Your result: High score';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Квиз'),
      ),
      body: currentQuestion < questions.length
          ? Quiz(
              question: questions[currentQuestion]['question'] as String,
              answers: (questions[currentQuestion]['answers']
                  as List<Map<String, Object>>),
              answerQuestion: _answerQuestion,
            )
          : Center(
              child: Text('Успешно го завршивте квизот!'),
            ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final Function(int) answerQuestion;

  Quiz({
    required this.question,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        ...answers.map((answer) {
          return ElevatedButton(
            onPressed: () => answerQuestion(answer['score'] as int),
            child: Text(answer['answerText'] as String),
          );
        }).toList(),
      ],
    );
  }
}
