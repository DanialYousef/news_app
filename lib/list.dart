import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modulesorder.dart';
int counter = 1;
List<Color> gradientColors = const [Color.fromRGBO(249, 136, 31, 1), Color.fromRGBO(255, 119, 76, 1)];
LinearGradient ? linergradientColors = LinearGradient(
  colors: gradientColors,
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

List <Order> orders = [
  Order(
    name: 'Danial' ,
    name2: 'Yousef' ,
    price: '20',
    count: 1,
  ),
  Order(
    name: 'dodo' ,
    name2: 'yosef' ,
    price: '2330',
    count: 2,

  ),
  Order(
    name: 'dsijd' ,
    name2: 'Youdlsdsef' ,
    price: '2233',
    count: 5,

  ),
  Order(
    name: 'adlkws' ,
    name2: 'dskdms' ,
    price: '292',
    count: 8,

  )
];
List <Order> orders2 = [
  Order(
    name: 'ALI' ,
    name2: 'Yousef' ,
    price: '20',
    count: 1,
  ),
  Order(
    name: 'alalalaaal' ,
    name2: 'yosef' ,
    price: '2330',
    count: 2,

  ),
  Order(
    name: 'adlsdakadlsda' ,
    name2: 'Youdlsdsef' ,
    price: '2233',
    count: 5,

  ),
  Order(
    name: 'aaaaaaaaaa' ,
    name2: 'dskdms' ,
    price: '292',
    count: 8,

  )
];
