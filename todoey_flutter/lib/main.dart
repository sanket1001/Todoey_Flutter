import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/screens/tasks_screen.dart';
import 'package:todoeyflutter/models/tasks.dart';
import 'package:todoeyflutter/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Tasks> allTasks = [
    Tasks(
      taskTitle: 'Task 1',
    ),
    Tasks(
      taskTitle: 'Task 2',
    ),
    Tasks(
      taskTitle: 'Task 5',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
