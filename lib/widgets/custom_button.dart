import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });
  final String buttonTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      ), 
      child: Text(buttonTitle,
      style: const TextStyle(
        color: Colors.white,
      ),
      ),
      );
  }
}