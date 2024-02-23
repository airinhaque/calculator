import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String display = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clearDisplay();
    } else if (buttonText == '+' || buttonText == '-') {
      num1 = double.parse(display);
      operand = buttonText;
      _clearDisplay();
    } else if (buttonText == '=') {
      num2 = double.parse(display);
      _calculate();
    } else {
      if (display == '0') {
        display = buttonText;
      } else {
        display += buttonText;
      }
    }
    setState(() {
      display;
    });
  }

  void _calculate() {
    double result = 0.0;
    switch (operand) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
    }
    display = result.toString();
  }

  void _clearDisplay() {
    display = '0';
    num1 = 0.0;
    num2 = 0.0;
    operand = '';
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(24.0),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.centerRight,
              child: Text(
                display,
                style: TextStyle(
                  fontSize: 48.0,
                ),
              ),
            ),
          ),
          Divider(),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('C'),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('0'),
                  _buildButton('='),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
