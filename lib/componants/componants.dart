import 'package:flutter/material.dart';

import 'colors.dart';

Widget buildTextField(
    IconData icon, String hintText, bool isPassword, type,) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextField(
      obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Palette.iconColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle:const TextStyle(fontSize: 14, color: Palette.textColor1),
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
navigate( context,screen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));
}
Widget bottom(data,onTap){
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
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
      child: Center(child:  Text(data  , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 25,color: Colors.white))),
    ),
  );
}