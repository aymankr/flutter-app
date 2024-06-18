import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import 'widgets/task_form.dart';
import 'widgets/task_list.dart';
import 'widgets/footer.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://source.unsplash.com/random',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: TaskList(),
              ),
              TaskForm(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
