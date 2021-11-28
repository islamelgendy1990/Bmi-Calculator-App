import 'package:bmi_calculator_app/Translations.dart';
import 'package:bmi_calculator_app/splash_screen.dart';
import 'package:bmi_calculator_app/theme/theme.dart';
import 'package:bmi_calculator_app/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Bmi Calculator',
      home: const Splash(),
      translations: Translation(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}





