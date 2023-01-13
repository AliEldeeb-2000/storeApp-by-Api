import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(height: 50,
        decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(11)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
