import 'package:farhana_string_addition_test/domain/string_calculator.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int _addition = 0;
  int _counter = -1;
  String _errorText = '';
  late StringCalculator stringCalculator;
  List<String> strNumbers = [
    "//[***]\n1***2***3",
    "//[*][%]\n1*2%4",
    "//;\n1;2",
    " 1\n2,5",
    "//;\n1;-2",
    "//;\n1;1002"
  ];

  void _add() {
    _counter++;
    stringCalculator = StringCalculator();
    if (_counter < 6) {
      _addition = stringCalculator.add(strNumbers[_counter]);
      if (_addition == -1) {
        _errorText = 'Negative numbers not allowed';
        _addition = 0;
      } else {
        _errorText = '';
      }
      setState(() {
        _counter;
        _addition;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _counter == -1 ? '' : strNumbers[_counter],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _errorText,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$_addition',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _add,
                  tooltip: 'Add',
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
