import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/TodoListModel.dart';

class TodoList extends StatelessWidget {
  final TextEditingController t1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoListModel todos = Provider.of<TodoListModel>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Expanded(
                child: ListView.builder(
              itemCount: todos.allTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos.allTasks[index].taskTitle),
                  trailing: FlatButton(
                      onPressed: () {
                        todos.deleteTask(todos.allTasks[index]);
                      },
                      child: Text("Done")),
                );
              },
            )),
          ),
          Container(
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  style: TextStyle(fontSize: 8.0),
                  decoration: InputDecoration(
                    labelText: 'Add Task',
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  controller: t1,
                )),
                RaisedButton(
                  onPressed: () {
                    todos.addTask(Task(taskTitle: t1.text));
                    t1.clear();
                  },
                  child: Text("ADD"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
