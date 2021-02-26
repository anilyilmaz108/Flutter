import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String gender;
  GenderButton({this.icon, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 50, color: Colors.lightBlue,),
        SizedBox(height: 10,),
        Text(gender,style: kMetinStili,),
      ],
    );
  }
}