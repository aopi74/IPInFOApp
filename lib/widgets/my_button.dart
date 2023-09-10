import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class my_button extends StatelessWidget {
  final String text;
  final icon;
  final onPressed;
  const my_button({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color(0xff886AE2),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Row(
          children: [
            Text(
              "${text}",
              style: TextStyle(color: Color(0xff481E71), fontSize: 18.0),
            ),
            const SizedBox(
              width: 8.0,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
