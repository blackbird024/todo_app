import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/util/to_do_list.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _controller = TextEditingController();

  List toDoList = [];

  @override
  void initState() {
    super.initState();
    loadToDoList(); // Cargar la lista de tareas al inicio
  }

  void checkBoxChanged(bool value, int index) {
    setState(() {
      toDoList[index][1] = value;
      saveToDoList(); // Guardar la lista de tareas cuando cambie
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      saveToDoList(); // Guardar la lista de tareas cuando cambie
    });
  }

  void createNewTask() async {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
          controller: _controller,
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
      saveToDoList(); // Guardar la lista de tareas cuando cambie
    });
    Navigator.of(context).pop();
  }

  // Cargar la lista de tareas desde SharedPreferences
  Future<void> loadToDoList() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? savedList = prefs.getStringList('toDoList');

    if (savedList != null) {
      setState(() {
        toDoList = savedList
            .map((task) => [task, false])
            .toList();
      });
    }
  }

  // Guardar la lista de tareas en SharedPreferences
  Future<void> saveToDoList() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> stringList = toDoList.map((task) => task[0].toString()).toList();
    await prefs.setStringList('toDoList', stringList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text(
          "TO DO",
          style: GoogleFonts.almendraSc(
            letterSpacing: 2.5,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: createNewTask,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16), // Espacio entre los botones

        ],
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value!, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }}
