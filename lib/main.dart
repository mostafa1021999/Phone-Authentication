import 'package:delivery/componants/fonts.dart';
import 'package:delivery/modules/login.dart';
import 'package:delivery/modules/main%20page.dart';
import 'package:delivery/modules/onBoarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'componants/colors.dart';
import 'firebase_options.dart';
import 'modules/otp number.dart';
import 'modules/routs of app icon.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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


