import 'package:flutter/material.dart';

class Buildwidget extends StatelessWidget {
  Buildwidget(
      {@required this.colour,
      @required this.str,
      @required this.textcolour,
      this.onPress});
  final Color colour;
  final String str;
  final Color textcolour;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        // ignore: deprecated_member_use
        child: FlatButton(
          padding: EdgeInsets.all(20.0),
          color: colour,
          onPressed: onPress,
          child: Text(
            str,
            style: TextStyle(
              color: textcolour,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
