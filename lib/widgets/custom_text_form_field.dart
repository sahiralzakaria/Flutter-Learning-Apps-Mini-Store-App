import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hint,
    this.onChanged,
    this.obscureText = false,
  });

  final String? hint;
  Function(String)? onChanged;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
      },
      style: TextStyle(color: Colors.yellow),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint ?? " ",
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pinkAccent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
