import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
              ),
            ),

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSave),

                SizedBox(
                  width: 8,
                ),

                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],

        ),
      ),
    );
  }
}
