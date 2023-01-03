import 'package:flutter/material.dart';
import 'package:todo/app/core/values/app_colors.dart';
import 'package:todo/app/core/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(IconData(personIcon, fontFamily: 'MaterialIcons'), color: purple),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons'), color: pink),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcons'), color: deepPurple),
    Icon(IconData(sportsIcon, fontFamily: 'MaterialIcons'), color: green),
    Icon(IconData(travelicon, fontFamily: 'MaterialIcons'), color: orange),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcons'), color: lightBlue),
  ];
}