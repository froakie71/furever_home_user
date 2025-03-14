import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(title),
    );
  }
}