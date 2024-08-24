import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.inputType ,required this.textFieldTitle,required this.onChanged});
  final String textFieldTitle;
  final Function(String) onChanged;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: textFieldTitle,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder:
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
              ),
      ),
    );
  }
}
