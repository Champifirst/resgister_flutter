import 'package:flutter/material.dart';

class CustomPassInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String obscuringCharacter;
  final String? Function(String?)? validator;

  const CustomPassInputField({
    required this.label,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.obscuringCharacter,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}