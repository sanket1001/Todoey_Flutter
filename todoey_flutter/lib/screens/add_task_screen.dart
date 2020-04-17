import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/tasks.dart';
import 'package:todoeyflutter/screens/tasks_screen.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              onChanged: (newText) {
                newTaskText = newText;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                if (newTaskText != null && newTaskText != '') {
                  Provider.of<TaskData>(
                    context,
                    listen: false,
                  ).addTask(task: Tasks(taskTitle: newTaskText));
                }
              },
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
