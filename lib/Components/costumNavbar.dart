import 'package:farmclick/Utils/colors.dart';
import 'package:flutter/material.dart';

AppBar costumNadvbar = new AppBar(
  backgroundColor: DARK_GREEN,
  foregroundColor: DARK_GREEN,
  title: Row(
    children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage("assets/images/woman.png"),
      )
    ],
  ),
);
