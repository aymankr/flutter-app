import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String title, String description) {
    Task newTask = Task(title: title, description: description);
    TaskService().addTask(newTask); // Assurez-vous d'appeler addTask du service
    tasks.add(newTask);
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void fetchTasks() async {
    tasks = await TaskService().getTasks();
    notifyListeners();
  }
}
