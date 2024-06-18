import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/task_view_model.dart';

class TaskForm extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Title',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              taskViewModel.addTask(
                _titleController.text,
                _descriptionController.text,
              );
              _titleController.clear();
              _descriptionController.clear();
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
