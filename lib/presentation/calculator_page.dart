import 'package:flutter/material.dart';
import '../../domain/entities/calculator.dart';
import '../domain/usecase/perform_operation.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final PerformOperation performOperation = PerformOperation(Calculator());

  double _firstNumber = 0;
  double _secondNumber = 0;
  double _result = 0;
  String _operation = '';

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _calculate() {
    setState(() {
      _firstNumber = double.parse(_controller1.text);
      _secondNumber = double.parse(_controller2.text);

      switch (_operation) {
        case '+':
          _result = performOperation.add(_firstNumber, _secondNumber);
          break;
        case '-':
          _result = performOperation.subtract(_firstNumber, _secondNumber);
          break;
        case '*':
          _result = performOperation.multiply(_firstNumber, _secondNumber);
          break;
        case '/':
          _result = performOperation.divide(_firstNumber, _secondNumber);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clean Architecture Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _operation = '+';
                    _calculate();
                  },
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _operation = '-';
                    _calculate();
                  },
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _operation = '*';
                    _calculate();
                  },
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _operation = '/';
                    _calculate();
                  },
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
