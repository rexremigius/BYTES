// ignore: unused_import
import 'package:bytes/constant.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {

  const CustomActionBar({Key? key}) : super(key: key);
  
  // final VoidCallback? onPressed;

  // CustomActionBar({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onPressed:(){
      //   Navigate.pop.(context);
      // };
      child: Container(
        padding: EdgeInsets.only(
          top: 72.0,
          left: 5.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.black,
            //     width: 2.0,
            //   ),
            //   borderRadius: BorderRadius.circular(30.0),
            // ),
            // CircleAvatar(
            //   radius: 40.0,
            //   backgroundImage: AssetImage("lib/assets/19EUIT150.jpg"),
            // ),
            //Text("ActionBarActionBar", style: Constants.boldHeading),
          ],
        ),
      ),
    );
  }
}
