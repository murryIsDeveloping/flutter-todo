import 'package:flutter/material.dart';

class TodoeyHero extends StatelessWidget {
  int tasksLength;

  TodoeyHero(this.tasksLength);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Icon(
              Icons.list,
              size: 30.0,
              color: Colors.lightBlueAccent,
            ),
            backgroundColor: Colors.white,
            radius: 30.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Todoey',
            style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700),
          ),
          Text(
            '$tasksLength Tasks',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
