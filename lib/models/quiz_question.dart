class QuizQuestion {
  const QuizQuestion(this.qus, this.answers);

  final String qus;
  final List<String> answers;

  List<String> getSuffledAnswers() {
    final suffle = List.of(answers);
    suffle.shuffle();
    return suffle;
  }
}
