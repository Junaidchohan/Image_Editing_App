import 'package:flutter/material.dart';
import 'package:image_editing_app/models/text_info.dart';
import 'package:image_editing_app/screens/edit_image_screen.dart';
import 'package:image_editing_app/widgets/default_button.dart';

abstract class EditImageViewmodel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  List<TextInfo> texts = [];
  int currentIndex = 0;

  void setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Selected for Styling", style: TextStyle(fontSize: 16.0)),
      ),
    );
  }

  void changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  void increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize = texts[currentIndex].fontSize += 2;
    });
  }

  void addNewText(BuildContext content) {
    setState(() {
      texts.add(
        TextInfo(
          text: textEditingController.text,
          left: 0,
          top: 0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          textAlign: TextAlign.left,
        ),
      );
      Navigator.of(context).pop();
    });
  }

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
            onPressed: () => addNewText(context),
            color: Colors.red,
            textColor: Colors.white,
            child: Text("Add Text"),
          ),
        ],
      ),
    );
  }
}
