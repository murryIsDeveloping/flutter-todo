class Task {
  bool checked;
  String title;

  Task({this.title, this.checked = false});

  void toggle(){
    checked = !checked;
  }
}