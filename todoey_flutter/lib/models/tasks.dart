class Tasks {
  String taskTitle;
  bool isDone;

  Tasks({this.taskTitle, this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }
}
