//حيدره منذر سليمان
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/style/theme.dart';

AppBar appbarnative({
   Widget? icon,
   IconData? IconLeft ,
   Text?  text ,
   IconData? IconRigth,
   required Function? function,
  required Function? function2,
}){
  return AppBar(
    backgroundColor: Colors.deepOrange,
    leading: icon ,
    title: Center(child: text),
    actions:
    [
      IconButton(onPressed: function!(), icon: Icon(IconRigth ))
    ],
  );
}