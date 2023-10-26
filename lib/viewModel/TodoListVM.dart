import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/model/todo.dart';
import 'package:http/http.dart' as http;

part 'TodoListVM.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() async {
    // The logic we previously had in our FutureProvider is now in the build method.
    return [
      Todo(description: 'Learn Flutter', completed: true),
      Todo(description: 'Learn Riverpod'),
    ];
  }

  Future<void> addTodo(Todo todo) async {
    await http.post(
      Uri.https('your_api.com', '/todos'),
      // We serialize our Todo object and POST it to the server.
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(todo.toJson()),
    );
  }
}