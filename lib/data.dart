import 'package:flutter/material.dart';
import 'package:todo_app_design/task.dart';

List<Map<String, dynamic>> newTasks = [
  {"title": "Go to gym", "time": "6:00 pm", "date": "2022-05-09"},
  {"title": "Watch Batman Movie", "time": "12:00 am", "date": "2022-05-10"},
  {
    "title": "Django Project Deadline",
    "time": "11:59 pm",
    "date": "2022-05-12"
  },
];
List<Map<String, dynamic>> doneTasks = [
  {"title": "Date with ******", "time": "4:00 pm", "date": "2022-05-05"},
  {"title": "Flutter Session", "time": "10:00 am", "date": "2022-05-04"},
];

void navigate(
    {required BuildContext context,
    required Map<String, dynamic> task,
    required bool isDone}) {
  Navigator.push(context,
      MaterialPageRoute(builder: (ctx) => Task(task: task, isDone: isDone)));
}
