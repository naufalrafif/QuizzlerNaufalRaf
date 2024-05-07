import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Nabu Muhammad adalah nabi terakhir', questionAnswer: true),
    Question(questionText: 'Khalid bin walid merupakan khalifah pertama?', questionAnswer: false),
    Question(questionText: 'Al quran terdiri dari 114 surah', questionAnswer: true),
    Question(questionText: 'nabi pertama adalah nabi adam', questionAnswer: true),
    Question(questionText: 'shalat di masjid pahalanya setara dengan pahala umroh', questionAnswer: true),
    Question(questionText: 'musailamah al kazab adalah sahabat rasullah', questionAnswer: false),
    Question(questionText: 'surat al baqarah diturunkan di kota madinah', questionAnswer: true),
    Question(questionText: 'rukun islam ada lima', questionAnswer: true),
    Question(questionText: 'shalat dimasjidil haram mendapatkan pahala sekitar 10000 pahala', questionAnswer: true),
    Question(questionText: 'ambil miqot bisa dijakarta', questionAnswer: false),
    Question(questionText: 'umar bin khatab merupakan khalifah kedua', questionAnswer:  true),
    Question(questionText: 'thawaf berputar kabah selama 7 kali', questionAnswer: true),
    Question(questionText: 'surah al bayyinah diturunkan di', questionAnswer: false),
  ];

 void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length -1) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }
  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}