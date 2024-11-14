import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';  // Import the expressions package

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String output = '';

  void buttonPressed(String text) {
    setState(() {
      input += text;
    });
  }

  void calculate() {
    try {
      // Evaluate the input string using the expressions package
      final expression = Expression.parse(input);
      final evaluator = ExpressionEvaluator();
      final result = evaluator.eval(expression, {});

      setState(() {
        // Show the result, formatted to two decimal places
        output = result.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        output = 'Error';
      });
    }
  }

  void clear() {
    setState(() {
      input = '';
      output = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Input field for the calculator
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextField(
                  controller: TextEditingController(text: input),
                  enabled: false,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            // Output field for the calculation result
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Grid for buttons
            Expanded(
              flex: 4,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  final buttonLabels = [
                    '1',
                    '2',
                    '3',
                    'C',
                    '4',
                    '5',
                    '6',
                    '/',
                    '7',
                    '8',
                    '9',
                    '*',
                    '0',
                    '=',
                    '.',
                    '+'
                  ];
                  return ElevatedButton(
                    onPressed: () {
                      if (buttonLabels[index] == 'C') {
                        clear();
                      } else if (buttonLabels[index] == '=') {
                        calculate();
                      } else {
                        buttonPressed(buttonLabels[index]);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                    ),
                    child: Text(
                      buttonLabels[index],
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
