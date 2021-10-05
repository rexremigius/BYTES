// ignore: import_of_legacy_library_into_null_safe
//import 'package:firebase_core/firebase_core.dart';
import 'package:bytes/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(       
        theme: ThemeData(
          textTheme:GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,            
          ),
          accentColor: Colors.amberAccent[700],
        ),
         home: LandingPage(),
        );
  }
}

