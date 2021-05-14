
import 'dart:core';
import 'package:flutter/material.dart';
import 'widget/Calcbutton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double firstNum;
  double secoundNum;
  String history ='';
  String dispText = '';
  String result ='';
  String operation ='';

  void btnClick(String btnVal){
    print(btnVal);
    if(btnVal == 'Del')
      {
        result = dispText.substring(0,(dispText.length -1));
      }
    else if(btnVal == 'C')
      {
        dispText = '';
        firstNum = 0;
        secoundNum = 0;
        result ='';
        history = '';
      }
    else if(btnVal == '+' || btnVal == '-' || btnVal == '/' || btnVal == 'X')
    {
      firstNum = double.parse(dispText);
      result='';
      operation = btnVal;
      dispText='';
    }
    else if(btnVal == '=')
    {

      secoundNum = double.parse(dispText);
      if(operation == '+')
        {

          result = (firstNum + secoundNum).toString();
          history = firstNum.toString() + operation.toString() + secoundNum.toString();
        }

      else if(operation == '-')
      {
        result = (firstNum - secoundNum).toString();
        history = firstNum.toString() + operation.toString() + secoundNum.toString();
      }
      else if(operation == 'X')
      {
        result = (firstNum*secoundNum).toString();
        history = firstNum.toString() + operation.toString() + secoundNum.toString();
      }
      else if(operation == '/')
      {
        result = (firstNum / secoundNum).toString();
        history = firstNum.toString() + operation.toString() + secoundNum.toString();
      }
      else if(operation == '%')
      {
        result = (firstNum % secoundNum).toString();
        history = firstNum.toString() + operation.toString() + secoundNum.toString();
      }
    }
    else
    {
      result = (dispText + btnVal).toString();
    }

    setState(() {
      dispText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CALCULATOR',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment(1.0,1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    history,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment(1.0,1.0),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    dispText,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 48,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(text:'C', fillColor: 0xFFFFEE58,callback: btnClick,width: 60.0,),
                  CalcButton(text:'Del', fillColor: 0xFFFFEE58,callback: btnClick,width: 60.0),
                  CalcButton(text:'%', fillColor: 0xFFFFEE58,callback: btnClick,width: 60.0),
                  CalcButton(text:'/', fillColor: 0xFFFFEE58,callback: btnClick,width: 60.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(text:'7', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'8', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'9', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'X', fillColor: 0xFFFFEE58,callback: btnClick,width: 60.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(text:'4', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'5', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'6', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'+', fillColor: 0xFFFFEE58,callback: btnClick,width: 60.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(text:'1', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'2', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'3', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'-', fillColor: 0xFFFFEE58,callback: btnClick,width: 60.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(text:'0', fillColor: 0xFFE0E0E0,callback: btnClick,width: 176.0),
                  CalcButton(text:'.', fillColor: 0xFFE0E0E0,callback: btnClick,width: 60.0),
                  CalcButton(text:'=', fillColor: 0xFFF9A825,callback: btnClick,width: 60.0),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

