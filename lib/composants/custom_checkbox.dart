import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color activeColor;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blue,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.value,
          onChanged: widget.onChanged,
          activeColor: widget.activeColor,
        ),
        Text(
          '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Utilisation de la couleur active pour le texte en gras
          ),
        ),
      ],
    );
  }
}