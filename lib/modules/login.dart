import 'package:delivery/componants/colors.dart';
import 'package:delivery/modules/otp%20number.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../componants/componants.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = false;
  bool isMale = true;
  bool isRememberMe = false;
  String countryCode='20';
  FirebaseAuth auth=FirebaseAuth.instance;
  TextEditingController numberController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logoApp.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.40),

              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true,isSignupScreen),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: 200 ,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false,isSignupScreen),
          // Bottom buttons
          Positioned(
            top: isSignupScreen? MediaQuery.of(context).size.height -250:MediaQuery.of(context).size.height - 330,
            right: 0,
            left: 0,
            child: !isSignupScreen ?Column(
              children: [
                Text( "Or Signin with"),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(Icons.facebook,
                          "Facebook", Palette.facebookColor),
                      buildTextButton(Icons.g_mobiledata_outlined,
                          "Google", Palette.googleColor),
                    ],
                  ),
                )
              ],
            ): const Padding(padding: EdgeInsets.all(8)),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.mail_outline, "info@gmail.com", false, TextInputType.emailAddress),
          buildTextField(
              Icons.lock_outline, "Enter your password", true, TextInputType.text),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Forgot Password?",
                  style: TextStyle(fontSize: 14, color: Palette.textColor1)),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          IntlPhoneField(decoration: InputDecoration(labelText: 'Phone number'),
          initialCountryCode: 'EG',
          onCountryChanged: (code){
              countryCode=code.fullCountryCode;
          },
          controller: numberController,)
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow,isSignupScreen) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
      top: 420,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 70,
          width: 250,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? InkWell(
                onTap: isSignupScreen?(){
                  phoneauth();
                 navigate(context, OtpNumber(phoneNumber: numberController.text, country: countryCode,));
                }:(){},
                child: Container(
                            decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
                            child: Center(child:  Text(isSignupScreen? 'Verify':'Login'  , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 25,color: Colors.white))),
                          ),
              )
              : Center(),
        ),
      ),
    );
  }

  Widget bottom(){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
      child: Center(child:  Text(isSignupScreen? 'Verify':'Login'  , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 25,color: Colors.white))),
    );
  }
  void phoneauth()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+201011671600',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      timeout: const Duration(seconds: 60),
      codeSent: (String verificationId, int? resendToken) async{
        String smsCode = '123456';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(credential);

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
