import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyButtonTheme extends StatelessWidget {
  final IconData icon;
  final Function onpress;
  MyButtonTheme({this.icon, this.onpress});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(minWidth: 36,
      child: OutlineButton(
        onPressed: onpress,
        borderSide: BorderSide(color: Colors.lightBlue,),
        child: Icon(icon,size: 10,),
      ),
    );
  }
}