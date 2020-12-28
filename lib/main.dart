import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/TodoList.dart';
import 'package:todo_list_provider/TodoListModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListModel>(
      create: (context) => TodoListModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("TODO"),
          ),
          body: TodoList(),
        ),
      ),
    );
  }
}
