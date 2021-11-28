import 'package:bmi_calculator_app/Translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_screen.dart';

class DetailsCalculate extends StatelessWidget {





  final int? result;
  final bool? isMale;
  final int? age;

  const DetailsCalculate({Key? key,
    required this.result,
    required this.age,
    required this.isMale,
  }) : super(key: key);


  String get resultPhrase{
    String resultText = '' ;
    if(result! >=25) {
      resultText = 'Overweight'.tr ;
    } else if(result! >=18.5) {
      resultText = 'normal'.tr ;
    } else {
      resultText = 'underweight'.tr ;
    }
    return resultText ;
  }



  String get resultNumber{
    String resultTextNumber = '' ;
    if(result! >=25) {
      resultTextNumber = '25 - 29,9'.tr ;
    } else if(result! >=18.5) {
      resultTextNumber = '18,5 - 24,9'.tr ;
    } else {
      resultTextNumber = 'Under 18,5'.tr ;
    }
    return resultTextNumber ;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Back to edit'.tr, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Colors.black87,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Text('Body mass index'.tr, style: const TextStyle( fontSize: 35,  fontWeight: FontWeight.w900,),
              ),
            ),
            Expanded(
              flex: 9, // 90% of space
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 40),
                    child: Column(
                      children: [
                        Text('measure of body fat'.tr, style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Colors.black87,
                        ),
                        ),
                        const SizedBox(height: 20,),
                        Text(resultPhrase, style: const TextStyle(fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.red),),
                        const SizedBox(height: 20,),
                        Text('$result'.tr, style: const TextStyle(fontSize: 60,
                            fontWeight: FontWeight.bold),),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('BMI range :'.tr, style: const TextStyle(fontSize: 22,
                                fontWeight: FontWeight.bold),),
                            const SizedBox(width: 5,),
                            Text(resultPhrase.tr, style: const TextStyle(fontSize: 22,
                                fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text(resultNumber, style: const TextStyle(fontSize: 25,
                            fontWeight: FontWeight.bold),),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Your have a'.tr, style: const TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w800, ),),
                            const SizedBox(width: 5,),
                            Text(resultPhrase.tr, style: const TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w800, ),),
                            const SizedBox(width: 5,),
                            Text('in body weight.'.tr, style: const TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w800, ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              color: Theme.of(context).accentColor,
              child: MaterialButton(
                child: Text('Re-Calculate'.tr, style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  const BmiScreen();

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