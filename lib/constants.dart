// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//LIGHT THEME
// Color lightBackgroundColor = Color.fromARGB(255, 17, 4, 4);
// Color lightTextColor = Colors.black;
// TextStyle lightTextStyle = TextStyle(
//   color: Colors.black,
// );

// //DARK THEME
// // Color darkBackgroundColor = Colors.black;
// TextStyle darkTextStyle = TextStyle(
//   color: Colors.white,
// );

Color buttonColor = Colors.blue;

Color backgroundColor(bool light) {
  return light ? Color.fromRGBO(219, 219, 219, 1) : Color(0xFF16264C);
}

Color textColor(bool light) {
  return light ? Colors.black : Colors.white;
}

IconThemeData iconAppBarTheme = IconThemeData(
  color: buttonColor,
);
