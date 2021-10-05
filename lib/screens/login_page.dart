import 'package:bytes/constant.dart';
import 'package:bytes/screens/register_page.dart';
import 'package:bytes/widgets/custom_input.dart';
import 'package:bytes/widgets/custombtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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

   Future<String?> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
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
      _loginFormLoading = true;
    });

    //run the login in account method
    String? _signInFeedback = await _loginAccount();

    //if we get error while creating account
    if (_signInFeedback != null) {
      _alertDialogBuiler(_signInFeedback);
    } else {
      Navigator.pop(context);
    }
  }

  //form input value
  String _loginEmail = "";
  String _loginPassword = "";

//default form loading - not loading
  bool _loginFormLoading = false;

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
                child: Text("LOGIN PAGE", style: Constants.boldHeading),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email...",
                     onChanged: (value) {
                    _loginEmail = value;
                  },
                  onSubmitted: (value) {
                   _passwordFocusNode.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    hintText: "Password...",
                     onChanged: (value) {
                    _loginPassword = value;
                  },
                  isPasswordField: true,
                  onSubmitted:(value){
                      _submitForm();
                  },
                  focusNode: _passwordFocusNode,
                  ),
                  CustomBtn(
                      text: "Login",
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _loginFormLoading,
                      outlineBtn: false)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomBtn(
                  text: "Create Account",
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder:(context)=>RegisterPage()),
                    );
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
