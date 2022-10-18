import 'package:calculator/operator_symbol.dart';
import 'package:flutter/material.dart';

class CalculatingScreen extends StatefulWidget {
  const CalculatingScreen({Key? key}) : super(key: key);

  @override
  State<CalculatingScreen> createState() => _CalculatingScreenState();
}

StringBuffer onScreen1 = StringBuffer();
StringBuffer onScreen2 = StringBuffer();

String operation = '';

double num1 = 0;
double num2 = 0;

double result = 0;

class _CalculatingScreenState extends State<CalculatingScreen> {
  // List equation = [number1.round(), operation, number2.round()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22252F),
      appBar: AppBar(
        title: const Text(
          'Light Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '$onScreen1',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36.0,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF2A2D35),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OperatorSymbol(
                      operator: 'AC',
                      color: const Color(0xFFC06F7E),
                      onPressed: () {
                        setState(() {
                          onScreen1.clear();
                        });
                      },
                    ),
                    const OperatorSymbol(operator: '(', color: Colors.teal),
                    const OperatorSymbol(operator: ')', color: Colors.teal),
                    OperatorSymbol(
                      operator: '÷',
                      color: Colors.teal,
                      onPressed: () {
                        setState(() {
                          operation = '÷';
                          if (onScreen1.isNotEmpty) {
                            String temp = onScreen1.toString();
                            num1 = double.parse(temp);
                            onScreen1.write(operation);
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OperatorSymbol(
                      operator: '7',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('7');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '8',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('8');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '9',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('9');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '×',
                      color: Colors.teal,
                      onPressed: () {
                        setState(() {
                          operation = '×';
                          if (onScreen1.isNotEmpty) {
                            String temp = onScreen1.toString();
                            num1 = double.parse(temp);
                            onScreen1.write(operation);
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OperatorSymbol(
                      operator: '4',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('4');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '5',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('5');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '6',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('6');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '-',
                      color: Colors.teal,
                      onPressed: () {
                        setState(() {
                          operation = '-';
                          if (onScreen1.isNotEmpty) {
                            String temp = onScreen1.toString();
                            num1 = double.parse(temp);
                            onScreen1.write(operation);
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OperatorSymbol(
                      operator: '1',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('1');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '2',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('2');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '3',
                      onPressed: () {
                        setState(() {
                          onScreen1.write('3');
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '+',
                      color: Colors.teal,
                      onPressed: () {
                        setState(() {
                          operation = '+';
                          if (onScreen1.isNotEmpty) {
                            String temp = onScreen1.toString();
                            num1 = double.parse(temp);
                            onScreen1.write(operation);
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OperatorSymbol(
                      operator: '.',
                      onPressed: () {
                        setState(() {
                          if (onScreen1.isNotEmpty) {
                            onScreen1.write('.');
                          }
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: '0',
                      onPressed: () {
                        setState(() {
                          if (onScreen1.isNotEmpty) {
                            onScreen1.write('0');
                          }
                        });
                      },
                    ),
                    OperatorSymbol(
                      operator: 'del',
                      color: const Color(0xFFC06F7E),
                      onPressed: () {
                        setState(
                          () {
                            String temp = onScreen1.toString();
                            int tempLength = temp.length;
                            temp = temp.substring(0, --tempLength);
                            onScreen1.clear();
                            onScreen1.write(temp);
                          },
                        );
                      },
                    ),
                    OperatorSymbol(
                      operator: '=',
                      color: Colors.teal,
                      onPressed: () {
                        setState(() {
                          String temp = onScreen1.toString();
                          int start = temp.indexOf(operation);
                          int end = temp.length;
                          temp = temp.substring(++start, end);
                          num2 = double.parse(temp);
                          switch (operation) {
                            case '+':
                              result = num1 + num2;
                              break;
                            case '-':
                              result = num1 - num2;
                              break;
                            case '×':
                              result = num1 * num2;
                              break;
                            case '÷':
                              result = num1 / num2;
                              break;
                            default:
                          }
                          onScreen1.clear();
                          onScreen1.write('$result');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
