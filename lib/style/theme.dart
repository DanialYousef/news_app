import 'package:flutter/material.dart';

var color = Color.fromARGB(255, 250, 120, 1) ;
var color2 = Color.fromARGB(255, 80, 200, 180);
var color3 = Color.fromARGB(20, 40, 40, 1);
var color4 = Color.fromRGBO(249, 136, 31, 1);

ThemeData theme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.deepOrange,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'DmSans',
        fontSize: 20,
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: Colors.deepOrange,
    type:  BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
  ),
);
ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
      color: Colors.deepOrange,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'DmSans',
        fontSize: 20,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange,
    type:  BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
  ),
);