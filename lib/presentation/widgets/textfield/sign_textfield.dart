import 'package:flutter/material.dart';

class SignTextfield extends StatefulWidget {
  SignTextfield({
    super.key,
    this.hintText,
    this.labelText,
    required this.controller,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  @override
  State<SignTextfield> createState() => _SignTextfieldState();
}

class _SignTextfieldState extends State<SignTextfield> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: widget.labelText == "Password"
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(),
        hintText: widget.hintText,
        labelText: widget.labelText,
      ),
      controller: widget.controller,
    );
  }
}
