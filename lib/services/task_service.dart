import '../models/task.dart';

class TaskService {
  List<Task> tasks = [];

  Future<List<Task>> getTasks() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return tasks;
  }

  void addTask(Task task) {
    tasks.add(task);
  }
}
