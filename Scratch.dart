import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  String task = task2();
  task3(task);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

String task2() {
  Duration delay = Duration(seconds: 3);
  late String result;
  Future.delayed(delay, (){
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task) {
  String result = 'task 3 data';
  print('Task 3 complete with $task');
}