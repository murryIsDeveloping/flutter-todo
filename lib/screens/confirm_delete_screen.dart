import 'package:flutter/material.dart';
import 'package:todoapp/models/tasks.dart';

class ConfirmDeleteScreen extends StatelessWidget {
  final Function remove;
  final Task task;


  ConfirmDeleteScreen(this.remove, this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Delete Task: ${task.title}',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FlatButton(
                onPressed: () {
                  remove(task);
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
