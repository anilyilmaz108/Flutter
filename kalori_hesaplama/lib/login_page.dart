import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalori_hesaplama/constants.dart';
import 'package:kalori_hesaplama/data.dart';
import 'package:kalori_hesaplama/input_data.dart';
import 'package:kalori_hesaplama/gender_button.dart';
import 'package:kalori_hesaplama/result_page.dart';

import 'my_button_theme.dart';
import 'new_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  InputData Inputs = InputData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalori Hesaplama'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: NewContainer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "   Günlük alınması gereken kalori miktari kişiden kişiye farklılık gösterir."
                      "Yaşınızı, boyunuzu cm, kilonuzu kg cinsinden değerleri girerek "
                      "günlük kaç kalori almanız gerektiğini hesaplayabilirsiniz.",
                  style: kAciklamaYazisi,
                ),
              ),
            ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: NewContainer(
                        child: Column(
                          children: [
                            Text(
                                "BOY",
                              style: kMetinStili,
                            ),
                            Text(
                                Inputs.length.toString(),
                              style: kSayiStili,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyButtonTheme(icon: FontAwesomeIcons.plus,onpress: (){setState(() {
                                  Inputs.length++;
                                });}),
                                MyButtonTheme(icon: FontAwesomeIcons.minus,onpress: (){setState(() {
                                  Inputs.length--;
                                });}),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),
                  Expanded(
                    child: NewContainer(
                      child: Column(
                        children: [
                          Text(
                            "KİLO",
                            style: kMetinStili,
                          ),
                          Text(
                            Inputs.weight.toString(),
                            style: kSayiStili,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButtonTheme(icon: FontAwesomeIcons.plus,onpress: (){setState(() {
                                Inputs.weight++;
                              });}),
                              MyButtonTheme(icon: FontAwesomeIcons.minus,onpress: (){setState(() {
                                Inputs.weight--;
                              });}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: NewContainer(
                      child: Column(
                        children: [
                          Text(
                            "YAŞ",
                            style: kMetinStili,
                          ),
                          Text(
                            Inputs.age.toString(),
                            style: kSayiStili,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButtonTheme(icon: FontAwesomeIcons.plus,onpress: (){setState(() {
                                Inputs.age++;
                              });}),
                              MyButtonTheme(icon: FontAwesomeIcons.minus,onpress: (){setState(() {
                                Inputs.age--;
                              });}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
          Expanded(
            child: NewContainer(
              child: Column(
                children: [
                  Text("Gün içerisindeki hareket seviyeniz",
                  style: kAciklamaYazisi,
                  ),
                  Text(Inputs.move.round().toString(),style: kSayiStili,),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    value: Inputs.move,
                    onChanged: (double newValue) {
                      setState(() {
                        Inputs.move = newValue;
                      });
                  },
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: NewContainer(
                    onTap: (){
                      setState(() {
                        Inputs.gender = "KADIN";
                      });
                    },
                    color: Inputs.gender=="KADIN" ? Colors.lime : Colors.white,
                    child: GenderButton(gender: "KADIN", icon: FontAwesomeIcons.venus,),
                  ),
                ),
                Expanded(
                  child: NewContainer(
                    onTap: (){
                      setState(() {
                        Inputs.gender = "ERKEK";
                      });
                    },
                    color: Inputs.gender=="ERKEK" ? Colors.lime : Colors.white,
                    child: GenderButton(gender: "ERKEK", icon: FontAwesomeIcons.mars,),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left : 50.0),
                      child: NewContainer(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                              UserData(length: Inputs.length, weight: Inputs.weight, move: Inputs.move, gender: Inputs.gender, age: Inputs.age),
                            )
                            ));
                          });
                        },
                        child: Text("HESAPLA",style: kMetinStili,),
                      ),
                    ),
                  ),
                  SizedBox(width: 80,),
                  Expanded(
                    child: NewContainer(
                      onTap: (){
                        setState(() {
                          Inputs.length = 170;
                          Inputs.weight = 60;
                          Inputs.age = 20;
                          Inputs.move = 3.0;
                          Inputs.gender = "KADIN";
                        });
                      },
                      child: Text("TEMİZLE",style: kMetinStili,),
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}






