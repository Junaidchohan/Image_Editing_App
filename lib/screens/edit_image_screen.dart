import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editing_app/widgets/edit_image_viewmodel.dart';
import 'package:image_editing_app/widgets/image_text.dart';

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
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Stack(
            children: [
              _selectedImage,
              for (int i = 0; i < texts.length; i++)
                Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    onLongPress: () {
                      print("Long press detected");
                    },
                    onTap: () {
                      print("Single press detected");
                    },
                    child: Draggable(
                      feedback: ImageText(textInfo: texts[i]),
                      child: ImageText(textInfo: texts[i]),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset off = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = off.dy;
                          texts[i].left = off.dx;
                        });
                      },
                    ),
                  ),
                ),
              creatorText.text.isNotEmpty
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        creatorText.text,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: _addNewTextFab,
    );
  }

  Widget get _selectedImage => Center(
    child: Image.file(
      File(widget.selectImage),
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
    ),
  );

  Widget get _addNewTextFab => FloatingActionButton(
    onPressed: () => addNewDialog(context),
    backgroundColor: Colors.white,
    tooltip: "Add New Text",
    child: Icon(Icons.edit, color: Colors.black),
  );
}
