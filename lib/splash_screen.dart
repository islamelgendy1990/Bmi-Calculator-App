import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:splash_screen_view/splash_screen_view.dart';

import 'bmi_screen.dart';



class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SplashScreenView(
      navigateRoute: const BmiScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "images/body.png",
      text: "BMI Calculator",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
