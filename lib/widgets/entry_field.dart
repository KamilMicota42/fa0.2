import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const EntryField({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
