import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:register/theme/theme.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.width = 200,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(lightColorScheme.primary)
          ),
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
    );
  }
}