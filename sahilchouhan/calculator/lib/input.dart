import 'package:flutter/material.dart';
import 'widgets.dart';
import 'calculator.dart';

List<String> sign = [''];

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String major = '';
  String minor = '';
  dynamic majornum = 0;
  dynamic minornum = 0;
  String stemp = '';

  Function intaddinteger(String sttr) {
    return () {
      if (majornum.runtimeType == int) {
        major = major + sttr;
        majornum = int.parse(major);
      } else if (majornum.runtimeType == double) {
        major = major + sttr;
        print(major);
        majornum = double.parse(major);
      }
      setState(() {});
      print(majornum);
    };
  }

  Function intdeleteinteger() {
    return () {
      setState(() {
        if (major.length > 1 && majornum >= 0 && majornum.runtimeType == int) {
          major = major.substring(0, major.length - 1);
          majornum = int.parse(major);
        } else if (major.length > 2 && majornum.runtimeType == int) {
          major = major.substring(0, major.length - 1);
          majornum = int.parse(major);
        } else if (major.length > 1 && majornum.runtimeType == double) {
          major = major.substring(0, major.length - 1);
          majornum = double.parse(major);
        } else {
          major = '';
          majornum = 0;
        }
      });
      print(majornum);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      minor,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      sign[sign.length - 1],
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      stemp,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                // color: Colors.red,
                child: Text(
                  major,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Buildwidget(
              colour: Colors.white,
              str: 'AC',
              onPress: () {
                setState(() {
                  major = '';
                  majornum = 0;
                  minornum = 0;
                  minor = '';
                  stemp = '';
                  sign = [''];
                });
              },
              textcolour: Colors.black,
            ),
            Buildwidget(
              colour: Colors.white,
              str: '+/-',
              onPress: () {
                setState(() {
                  majornum = -majornum;
                  major = '$majornum';
                });
              },
              textcolour: Colors.black,
            ),
            Buildwidget(
              colour: Colors.white,
              str: '%',
              onPress: () {
                majornum = percent(majornum);
                major = '$majornum';
                setState(() {});
              },
              textcolour: Colors.black,
            ),
            Buildwidget(
              colour: Colors.orange,
              str: '/',
              onPress: () {
                if (minornum == 0) {
                  minornum = majornum;
                  majornum = 0;
                  major = '';
                  minor = '$minornum';
                  sign.add('/');
                } else {
                  minornum = calculator(minornum, majornum, divide);
                  minor = '$minornum';
                  sign.add('/');
                }
                setState(() {});
              },
              textcolour: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            Buildwidget(
                colour: Colors.white,
                str: '1',
                onPress: intaddinteger('1'),
                textcolour: Colors.black),
            Buildwidget(
                colour: Colors.white,
                str: '2',
                onPress: intaddinteger('2'),
                textcolour: Colors.black),
            Buildwidget(
                colour: Colors.white,
                str: '3',
                onPress: intaddinteger('3'),
                textcolour: Colors.black),
            Buildwidget(
              colour: Colors.orange,
              str: '*',
              onPress: () {
                if (minornum == 0) {
                  minornum = majornum;
                  majornum = 0;
                  major = '';
                  minor = '$minornum';
                  sign.add('*');
                } else {
                  minornum = calculator(minornum, majornum, multi);
                  minor = '$minornum';
                  sign.add('*');
                }
                setState(() {});
              },
              textcolour: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            Buildwidget(
                colour: Colors.white,
                str: '4',
                onPress: intaddinteger('4'),
                textcolour: Colors.black),
            Buildwidget(
                colour: Colors.white,
                str: '5',
                onPress: intaddinteger('5'),
                textcolour: Colors.black),
            Buildwidget(
                colour: Colors.white,
                str: '6',
                onPress: intaddinteger('6'),
                textcolour: Colors.black),
            Buildwidget(
              colour: Colors.orange,
              str: '-',
              onPress: () {
                if (minornum == 0) {
                  minornum = majornum;
                  majornum = 0;
                  major = '';
                  minor = '$minornum';
                  sign.add('-');
                } else {
                  minornum = calculator(minornum, majornum, sub);
                  minor = '$minornum';
                  sign.add('-');
                }
                setState(() {});
              },
              textcolour: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            Buildwidget(
                colour: Colors.white,
                str: '7',
                onPress: intaddinteger('7'),
                textcolour: Colors.black),
            Buildwidget(
                colour: Colors.white,
                str: '8',
                onPress: intaddinteger('8'),
                textcolour: Colors.black),
            Buildwidget(
                colour: Colors.white,
                str: '9',
                onPress: intaddinteger('9'),
                textcolour: Colors.black),
            Buildwidget(
              colour: Colors.orange,
              str: '+',
              onPress: () {
                if (minornum == 0) {
                  minornum = majornum;
                  majornum = 0;
                  major = '';
                  minor = '$minornum';
                  sign.add('+');
                } else {
                  minornum = calculator(minornum, majornum, add);
                  minor = '$minornum';
                  sign.add('+');
                }
                setState(() {});
              },
              textcolour: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            Buildwidget(
              colour: Colors.white,
              str: '0',
              onPress: intaddinteger('0'),
              textcolour: Colors.black,
            ),
            Buildwidget(
              colour: Colors.orange,
              str: 'del',
              onPress: intdeleteinteger(),
              textcolour: Colors.white,
            ),
            Buildwidget(
              colour: Colors.white,
              str: '.',
              onPress: () {
                if (major.length >= 1 && majornum.runtimeType == int) {
                  major = major + '.';
                } else if (major.length == 0 && majornum.runtimeType == int) {
                  major = '0.';
                }
                majornum = double.parse(major);
                setState(() {});
              },
              textcolour: Colors.black,
            ),
            Buildwidget(
              colour: Colors.orange,
              str: '=',
              onPress: () {
                if (minornum == 0) {
                } else {
                  stemp = '$majornum';
                  String so = sign[sign.length - 1];
                  if (so == '+') {
                    majornum = calculator(minornum, majornum, add);
                  } else if (so == '-') {
                    majornum = calculator(minornum, majornum, sub);
                  } else if (so == '*') {
                    majornum = calculator(minornum, majornum, multi);
                  } else if (so == '/') {
                    majornum = calculator(minornum, majornum, divide);
                  }
                }
                major = '$majornum';

                setState(() {});
              },
              textcolour: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
