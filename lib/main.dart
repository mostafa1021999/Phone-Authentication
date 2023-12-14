import 'package:delivery/componants/fonts.dart';
import 'package:delivery/modules/login.dart';
import 'package:delivery/modules/onBoarding.dart';
import 'package:flutter/material.dart';
import 'componants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: mainColor, //here is where the error resides
      ),
      debugShowCheckedModeBanner: false,
      home: LoginSignupScreen(),
    );
  }
}
