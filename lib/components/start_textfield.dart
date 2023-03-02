import 'package:flutter/material.dart';

class NewTextField extends StatelessWidget {
  const NewTextField(
      {super.key,
      required this.placeholderText,
      required this.controller,
      this.startIcon,
      this.endIcon,
      this.isOn = false});

  final String placeholderText;
  final Widget? endIcon;
  final Icon? startIcon;
  final TextEditingController controller;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: controller,
        obscureText: isOn,
        decoration: InputDecoration(
          hintText: placeholderText,
          suffixIcon: endIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
