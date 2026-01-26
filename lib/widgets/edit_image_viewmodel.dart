import 'package:flutter/material.dart';
import 'package:image_editing_app/screens/edit_image_screen.dart';
import 'package:image_editing_app/widgets/default_button.dart';

abstract class EditImageViewmodel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  void addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Add New Text"),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.edit),
            filled: true,
            hintText: "Your Text Here...",
          ),
        ),
        actions: <Widget>[
          DefaultButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.white,
            textColor: Colors.black,
            child: Text("Back"),
          ),
          DefaultButton(
            onPressed: () {},
            color: Colors.red,
            textColor: Colors.white,
            child: Text("Add Text"),
          ),
        ],
      ),
    );
  }
}
