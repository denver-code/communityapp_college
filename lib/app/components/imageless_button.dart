import 'package:flutter/material.dart';

class ImagelessSecondaryButton extends StatelessWidget {
  const ImagelessSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.borderColor,
  });

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: color, width: 3),
          backgroundColor: borderColor,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
