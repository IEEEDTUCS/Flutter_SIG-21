import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final Function callback;
  final double width ;

  const CalcButton({
    this.text,
    this.fillColor,
    this.callback,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
        width: width,
        height: 60.0,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          onPressed: () => callback(text),
          color: Color(fillColor),
        ),
      ),
    );
  }
}

