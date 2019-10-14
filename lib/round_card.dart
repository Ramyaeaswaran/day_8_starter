import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final Icon icon;
  final Function callback;

  RoundButton({this.icon, this.callback});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      child: icon,
      elevation: 6,
      fillColor: Color(0xFF4C5FE),
      constraints: BoxConstraints.tightFor(width: 55, height: 55),
      shape: CircleBorder(),
    );
  }
}