import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/components/todoey_hero.dart';
import 'package:todoapp/components/todoey_list.dart';
import 'package:todoapp/models/tasks.dart';
import 'package:todoapp/screens/add_task_screen.dart';


class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(title: 'Get Milk')
  ];

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodoeyHero(tasks.length),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: TodoeyList(tasks, update),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => AddTaskScreen(addItem, myController),
          ),
        },
        child: Icon(Icons.add),
      ),
    );
  }

  addItem(){
    setState(() {
      tasks.add(Task(title: myController.text));
      myController.clear();
      Navigator.pop(context);
    });
  }

  update(){
    setState(() {});
  }
}