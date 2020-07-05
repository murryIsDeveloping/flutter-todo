import 'package:flutter/material.dart';
import 'package:todoapp/models/tasks.dart';
import 'package:todoapp/screens/confirm_delete_screen.dart';

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
  final Function remove;
  final Function update;

  TodoeyItem(this.task, this.remove, this.update);

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
      onLongPress: () => {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => ConfirmDeleteScreen(remove, task),
        ),
      },
    );
  }
}

class TodoeyList extends StatelessWidget {
  final Function update;
  final List<Task> tasks;
  final Function remove;

  TodoeyList(this.tasks, this.remove, this.update);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return TodoeyItem(tasks[index], remove, update);
      },
      itemCount:  tasks.length,
    );
  }
}
