import 'package:flutter/material.dart';
import 'main.dart';

class TextArea extends StatelessWidget {
  TextArea(
      {this.icon,
      this.inputType,
      this.errorMessage,
      this.controller,
      this.inputHint});
  final controller;
  final errorMessage;
  final inputType;
  final icon;
  final inputHint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        textAlign: TextAlign.center,
        // onChanged: () {},
        decoration: InputDecoration(
          icon: Icon(icon),
          errorText: errorMessage.isNotEmpty ? errorMessage : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
