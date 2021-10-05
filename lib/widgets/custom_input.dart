import 'package:bytes/constant.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? isPasswordField;
  CustomInput(
      {this.hintText,
      required this.onChanged,
      required this.onSubmitted,
      this.focusNode,
      this.textInputAction,
      this.isPasswordField});
  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.black,
        //   width: 2.0
        // )
        borderRadius: BorderRadius.circular(18.0),
        color: Color(0xFFF2F2F2),
      ),
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? "Hint Text...",
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 18.0,
            )),
        style: Constants.regularDarkText,
      ),
    );
  }
}
