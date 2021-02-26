import 'package:flutter/material.dart';
import 'package:kalori_hesaplama/calculate.dart';
import 'package:kalori_hesaplama/constants.dart';
import 'package:kalori_hesaplama/data.dart';
import 'package:kalori_hesaplama/new_container.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage(this.userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SONUÇ SAYFASI"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: CircleAvatar(radius: 60,
                backgroundImage: AssetImage("assets/images/1.jpg",),
              ),
            ),
          ),
          SizedBox(height: 20,),
          NewContainer(child: Text("Kalori İhtiyacınız : ${Calculate(userData).calculate_kcal().toString()} Kcal",style: kSonucYazisi,),color: Colors.lightBlueAccent,),
          NewContainer(child: Text("Vücut Kitle İndeksi : ${Calculate(userData).calculate_bmi().toString()}",style: kSonucYazisi,),color: Colors.lightBlueAccent,),
          NewContainer(child: Text("Tavsiye : ${Calculate(userData).recommend().toString()}",style: kSonucYazisi,),color: Colors.lightBlueAccent,),
        ],
      ),
    );
  }
}
