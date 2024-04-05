import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obscuretext;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        hintText: hintext,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
