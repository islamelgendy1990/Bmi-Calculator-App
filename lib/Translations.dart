
// ignore_for_file: file_names

import 'package:bmi_calculator_app/langs/ar.dart';
import 'package:bmi_calculator_app/langs/en.dart';
import 'package:get/get.dart';


class Translation extends Translations {
  @override

  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
  };
}
