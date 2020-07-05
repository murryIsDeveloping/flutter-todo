import 'package:flutter/material.dart';
import 'package:todoapp/models/tasks.dart';

class ItemCheckbox extends StatelessWidget {
  final bool checked;
  final Function onChange;

  ItemCheckbox(this.checked, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checked,
      onChanged: onChange,
    );
  }
}

class TodoeyItem extends StatelessWidget {
  final Task task;
  final Function update;

  TodoeyItem(this.task, this.update);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          task.title,
          style: TextStyle(decoration: task.checked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        trailing: ItemCheckbox(task.checked, (bool newVal) {
          task.toggle();
          update();
        }),
    );
  }
}

class TodoeyList extends StatelessWidget {
  final Function update;
  final List<Task> tasks;

  TodoeyList(this.tasks, this.update);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return TodoeyItem(tasks[index], update);
      },
      itemCount:  tasks.length,
    );
  }
}
