import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/task_view_model.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return ListView.builder(
      itemCount: taskViewModel.tasks.length,
      itemBuilder: (context, index) {
        final task = taskViewModel.tasks[index];
        return ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              taskViewModel.removeTask(index);
            },
          ),
        );
      },
    );
  }
}
