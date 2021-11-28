

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {


  final _get_storage = GetStorage();
  final storageKey = "isDarkMode";



  ThemeMode getThemeMode(){

    return isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light ;

}


  bool isSaveDarkMode(){
    
    return _get_storage.read(storageKey) ?? false ;
    
  }


  void saveThemeMode(bool isDarkMode){

    _get_storage.write(storageKey, isDarkMode);
    
  }


  void changeThemeMode(){

    Get.changeThemeMode(isSaveDarkMode() ? ThemeMode.light : ThemeMode.dark );
    saveThemeMode(!isSaveDarkMode());
  }

}