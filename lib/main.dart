import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object quizBrain
QuizBrain quizBrain = QuizBrain();

// main Method
void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 121, 184),
        appBar: AppBar(
          title: Center(child: Text('Quizzler Naufal Rafif')), // Judul appbar
          backgroundColor:
              Color.fromARGB(255, 132, 241, 150), // Warna appbar
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // array/list untuk menyimpan score, berupa Icon check or close.
  List<Icon> scoreKeeper = [];

  // menghitung jawaban benar dan salah
  int numCorrect = 0;
  int numIncorrect = 0;

  // fungsi mengecek jawaban dari user (parameter userPickedAnswer)
  // ke jawaban dari daftar pertanyaan (list questions/_questionBanks)
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    // setState
    setState(() {
      if (quizBrain.isFinished()) {
        // Tambahkan logika penanganan ketika quiz selesai di sini
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the Quiz\n'
              'Correct Answers: ${numCorrect + 1}\n'
              'Incorrect Answers: $numIncorrect\n'
              'Total Questions: ${quizBrain.getTotalQuestions()}',
        ).show();

        // Reset skor dan nomor pertanyaan setelah selesai
        numCorrect = 0;
        numIncorrect = 0;
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.circle,
            color: Color.fromARGB(255, 224, 224, 224),
          ));
          numCorrect++;
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Color.fromARGB(255, 21, 21, 21),
          ));
          numIncorrect++;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 23, 24, 24),
                  )),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 221, 226, 195)),
                foregroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 18, 18, 18)),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "TRUE",
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 49, 216, 7)),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "FALSE",
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}