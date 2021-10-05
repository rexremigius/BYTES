// ignore: unused_import
import 'package:bytes/constant.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final bool? outlineBtn;
  final bool? isLoading;
  CustomBtn(
      {this.text, required this.onPressed, this.outlineBtn, this.isLoading});
  @override
  Widget build(BuildContext context) {
    bool _outlinebtn = outlineBtn ?? false;
    bool _isloading = isLoading ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 65.0,
        alignment: Alignment.center,
        // padding: EdgeInsets.only(
        //   bottom: 22.0,
        // ),
        decoration: BoxDecoration(
          color: _outlinebtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        child: Stack(
          children: [
            Visibility(
              visible: _isloading ? false : true,
              child: Center(
                child: Text(
                  text ?? "Text...",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: _outlinebtn ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isloading,
              child: Center(
                child: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
