import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final int taskNumber;

  TaskTile({this.taskNumber});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Provider.of<TaskData>(
          context,
          listen: false,
        ).deleteTask(
          taskNumber: taskNumber,
        );
      },
      title: Text(
        Provider.of<TaskData>(
          context,
          listen: false,
        ).allTasks[taskNumber].taskTitle,
        style: TextStyle(
          decoration: Provider.of<TaskData>(
            context,
            listen: false,
          ).allTasks[taskNumber].isDone
              ? TextDecoration.lineThrough
              : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: Provider.of<TaskData>(
          context,
          listen: false,
        ).allTasks[taskNumber].isDone,
        onChanged: (newValue) {
          Provider.of<TaskData>(
            context,
            listen: false,
          ).updateTask(taskNumber: taskNumber);
        },
      ),
    );
  }
}
