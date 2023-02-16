import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BatManTextField extends StatelessWidget {
  String Label;
  BatManTextField({required this.Label});
  var border = OutlineInputBorder(
      borderSide: BorderSide(width: 2.5, color: Colors.white));
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior:FloatingLabelBehavior.always ,//important to write a text on border
        enabledBorder: border,border: border, /*labelText: Text(Label),*/labelText: Label),
    );
  }
}
