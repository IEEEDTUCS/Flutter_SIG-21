import 'package:flutter/material.dart';
import 'scientificCalculator.dart';
//import 'package:google_fonts/google_fonts.dart';

  Icon daylight = Icon(Icons.nights_stay);
  ThemeData themebutton = ThemeData.light();

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  
  void themedecider(){
    if(themebutton==ThemeData.dark()){
      daylight=Icon(Icons.nights_stay);
      themebutton=ThemeData.light();
    }
    else{
      daylight=Icon(Icons.wb_sunny);
      themebutton=ThemeData.dark();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themebutton,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {
                themedecider();
              });
            },
            icon: daylight,
          ),
          title: Text(
            'CALCULATOR',
            //style: GoogleFonts.getFont('Ubuntu'),
          ),
        ),
        body: ScientificCalculator(),
      ),  
    );
  }
}