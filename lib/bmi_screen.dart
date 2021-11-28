import 'dart:math';
import 'package:bmi_calculator_app/theme/theme_service.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:bmi_calculator_app/details_calculate.dart';
import 'package:bmi_calculator_app/langs/app_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);


  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {


  // final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
  //     ? 'DarkTheme'
  //     : 'LightTheme';


  bool isMale = true ;

  double height = 120.0 ;

  int weight = 40 ;
  int age = 20 ;

  String _selectedLang = 'en';

  bool _isDark = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height *2/28,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Switch(
                    activeThumbImage: const AssetImage('images/light.png'),
                    inactiveThumbImage: const AssetImage('images/dark.png'),
                    activeColor: Colors.grey[200],
                    value: _isDark,
                    onChanged: (value){
                      ThemeService().changeThemeMode();
                      _isDark = value ;
                    },
                  ),
                  //  IconButton(
                  //   onPressed: (){
                  //     ThemeService().changeThemeMode();
                  //   },
                  //   icon: const Icon(Icons.brightness_4),
                  // ),
                   Center(
                    child: Text('BMI Calculator'.tr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),),
                  ),
                 GetBuilder<AppLanguage>(
                   init: AppLanguage(),
                   builder: (controller){
                     return  DropdownButton<dynamic>(
                       borderRadius:  BorderRadius.circular(8),
                       iconEnabledColor: Colors.grey[900],
                       items:  const [
                         DropdownMenuItem(
                           child: Text("en" ,style: TextStyle(color: Colors.black),),
                           value: 'en',
                         ),
                         DropdownMenuItem(
                           child: Text("ع", style: TextStyle(color: Colors.black),),
                           value: 'ar',
                         ),
                       ],
                       value: controller.appLocale,
                       onChanged: (value){
                         controller.changeLanguage(value);
                         Get.updateLocale(Locale(value));
                       },
                       style: const TextStyle(color: Colors.black, fontSize: 20),
                       dropdownColor: _isDark ? Colors.white : Colors.grey[400] ,
                     );
                   },
                 ),
                ],
              ),
              color: Theme.of(context).accentColor,
            ),
            Expanded(
              flex: 3, // 30% of space
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child:  InkWell(
                        onTap: (){
                          setState(() {
                            isMale = true ;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/male.png", width: 100, height: 100,),
                              const SizedBox(height: 15,),
                               Text('Male'.tr, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0,),
                    Expanded(
                      child:  InkWell(
                        onTap: (){
                          setState(() {
                            isMale = false ;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/female.png", width: 100, height: 100,),
                              const SizedBox(height: 15,),
                               Text('Female'.tr, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !isMale ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3, // 30% of space
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT'.tr, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('${height.round()}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),),
                          const SizedBox(width: 5.0,),
                          Text('CM'.tr, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),),
                        ],
                      ),
                      Slider(
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor: Theme.of(context).backgroundColor,
                        value: height,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value){
                          setState(() {
                            height = value ;
                          });
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3, // 30% of space
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Weight'.tr, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            Text('$weight', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Age'.tr, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            Text('$age', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              color: Theme.of(context).accentColor,
              child: MaterialButton(
                child: Text('Calculate'.tr, style: const TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),),
                onPressed: (){

                  double result = weight/pow(height/100, 2);
                  print(result.round());

                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  DetailsCalculate(
                      age: age,
                      result: result.round(),
                      isMale: isMale,
                    );

                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
