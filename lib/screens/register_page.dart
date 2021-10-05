// ignore: unused_import
import 'dart:ffi';

import 'package:bytes/constant.dart';
import 'package:bytes/widgets/custom_input.dart';
import 'package:bytes/widgets/custombtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Display error alert
  Future<void> _alertDialogBuiler(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
              )
            ],
          );
        });
  }

  //User registeration
  Future<String?> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  //Submit form
  void _submitForm() async {
    //set the form loading
    setState(() {
      _registerFormLoading = true;
    });

    //run the create account method
    String? _createAccountFeedback = await _createAccount();

    //if we get error while creating account
    if (_createAccountFeedback != null) {
      _alertDialogBuiler(_createAccountFeedback);
    } else {
      Navigator.pop(context);
    }
  }

//default form loading - not loading
  bool _registerFormLoading = false;

//form input value
  String _registerEmail = "";
  String _registerPassword = "";

//Focus node for input fields
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        //  color: Colors.amberAccent[700],
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 22.0,
              ),
              child: Text("CREATE A ACCOUNT", style: Constants.boldHeading),
            ),
            Column(
              children: [
                CustomInput(
                  hintText: "Email...",
                  onChanged: (value) {
                    _registerEmail = value;
                  },
                  onSubmitted: (value) {
                    _passwordFocusNode.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                ),
                CustomInput(
                  hintText: "Password...",
                  onChanged: (value) {
                    _registerPassword = value;
                  },
                  isPasswordField: true,
                  onSubmitted: (value) {
                    _submitForm();
                  },
                  focusNode: _passwordFocusNode,
                ),
                CustomBtn(
                    text: "Create Account",
                    onPressed: () {
                      _submitForm();
                    },
                    isLoading: _registerFormLoading,
                    outlineBtn: false)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ),
              child: CustomBtn(
                text: "Back to Login",
                onPressed: () {
                  Navigator.pop(context);
                },
                outlineBtn: true,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
