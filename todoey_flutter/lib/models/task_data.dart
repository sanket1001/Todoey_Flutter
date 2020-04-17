import 'package:flutter/foundation.dart';
import 'package:todoeyflutter/models/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> allTasks = [
    Tasks(
      taskTitle: 'Task 1',
    ),
    Tasks(
      taskTitle: 'Task 2',
    ),
    Tasks(
      taskTitle: 'Task 6',
    )
  ];

  int get taskCount {
    return allTasks.length;
  }

  void updateTask({int taskNumber}) {
    allTasks[taskNumber].toggleIsDone();
    notifyListeners();
  }

  void addTask({task}) {
    allTasks.add(task);
    notifyListeners();
  }

  void deleteTask({int taskNumber}) {
    allTasks.removeAt(taskNumber);
    notifyListeners();
  }
}
