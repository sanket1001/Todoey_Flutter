import 'package:todoeyflutter/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, itemNumber) {
        return TaskTile(
          taskNumber: itemNumber,
        );
      },
      itemCount: Provider.of<TaskData>(context).taskCount,
    );
  }
}
