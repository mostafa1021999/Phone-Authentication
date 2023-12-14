import 'package:flutter/material.dart';

import 'colors.dart';

Widget buildTextField(
    IconData icon, String hintText, bool isPassword, bool isEmail) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextField(
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Palette.iconColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
      ),
    ),
  );
}

Widget date(text,selected){
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Palette.textColor1),
      borderRadius: BorderRadius.circular(35)
    ),
    child: Row(
      children: [
        Icon(
          Icons.date_range,
          color: Palette.iconColor,
        ),
        SizedBox(width: 15,),
        Text(text,style:TextStyle(fontSize: 14, color:selected?Palette.choose: Palette.textColor1))
      ],
    ),
  );
}
Widget bottom(data,onTap){
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(35),),
      child: Center(child:  Text(data , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 25,color: Colors.black))),
    ),
  );
}