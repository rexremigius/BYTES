import 'package:bytes/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "AccountTab",
              style: Constants.boldHeading,
            ),
          ),
          Container(
            // ignore: deprecated_member_use
            child: FlatButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("SIGNOUT")),
          )
        ],
      ),
    );
  }
}
