import 'dart:async';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/pantalla-home.png"), context);
    precacheImage(AssetImage("assets/images/pantalla-home-tablet.png"), context);
    Timer(Duration(seconds: 2),() => Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false));
    return Container(
      decoration: Functions.getFondoSplash(MediaQuery.of(context).size.width),
    );
  }

}