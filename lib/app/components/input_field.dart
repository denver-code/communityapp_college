import 'package:community_app/app/components/hex_to_color.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.helpText,
    required this.icon,
    required this.controller,
    this.obscureText = false,
  });

  final String helpText;
  final Icon icon;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: HexColor.fromHex("#DADCDC"),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                obscureText: obscureText,
                controller: controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: helpText,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
