import 'question.dart';

class AppQuestion {
  int _questionNumber = 0;

  final List<Question> _questionGroub = [
    Question(
      q: 'عدد الكواكب فى المجموعة الشمسية هو ثمانية كواكب ؟',
      i: 'images/image-1.jpg',
      a: true,
    ),
    Question(
      q: 'القطط هى حيوانات لاحم ؟',
      i: 'images/image-2.jpg',
      a: true,
    ),
    Question(
      q: 'الصين موجودة فى القارة الافريقي ؟',
      i: 'images/image-3.jpg',
      a: false,
    ),
    Question(
      q: 'الارض مسطحة وليست كروية ؟',
      i: 'images/image-4.jpg',
      a: false,
    ),
    Question(
      q: 'باستطاعة الانسان البقاء على قيد الحياة بدون اكل اللحوم ؟',
      i: 'images/image-5.jpg',
      a: true,
    ),
    Question(
      q: 'الشمس تدور حول الأرض والأرض تدور حول القمر ؟',
      i: 'images/image-6.jpg',
      a: false,
    ),
    Question(
      q: 'الحيوانات لا تشعر بالأم ؟',
      i: 'images/image-7.jpg',
      a: false,
    ),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionGroub.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroub[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroub[_questionNumber].questionImage;
  }

  bool getQuestionAnswe() {
    return _questionGroub[_questionNumber].questionAnswer;
  }

  bool examEnd() {
    if (_questionNumber >= _questionGroub.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restExam() {
    _questionNumber = 0;
  }
}
