import 'package:flutter/material.dart';

class InfoTileText extends StatelessWidget {
  final text;
  const InfoTileText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "${text}",
        style: const TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
