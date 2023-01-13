import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static initSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}
 getRelativeHeight(double percentage) {
  return percentage * SizeConfig.screenHeight;
}

getRelativeWidth(double percentage) {
  return percentage * SizeConfig.screenWidth;
}