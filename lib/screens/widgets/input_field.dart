import 'package:flutter/material.dart';


class InputField extends StatelessWidget{
  String hintText;
  TextInputType? inputType;
  void Function(String?)? onChange;
  Widget? suffixIcon;
  bool? obscureText;

  InputField({this.inputType, this.suffixIcon,this.obscureText, required this.hintText,this.onChange,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:25),
      child: TextField(
        keyboardType: inputType,
        onChanged: onChange,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
                borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.5
                ),
            ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
          )
        ),

      ),
    );
  }


}