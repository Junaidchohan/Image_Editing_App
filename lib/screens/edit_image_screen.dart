import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editing_app/widgets/edit_image_viewmodel.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key, required this.selectImage});

  final String selectImage;
  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewmodel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.selectImage)),
      floatingActionButton: _addNewTextFab,
    );
  }

  Widget get _addNewTextFab => FloatingActionButton(
    onPressed: () => addNewDialog(context),
    backgroundColor: Colors.white,
    tooltip: "Add New Text",
    child: Icon(Icons.edit, color: Colors.black),
  );
}
