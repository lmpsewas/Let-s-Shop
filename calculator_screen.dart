import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // initialization of variables
  var userInput = '';
  var answer = '';

// Array of buttons
  final List<String> buttons = [
    'C',
    '^',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  // check the operator for making decision on colour of buttons
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  // function to check the if a operator already existed in the last input
  bool checkSign(){
    if(userInput.isEmpty){
      return false;
    }else if(userInput.endsWith('^') || userInput.endsWith('%') || userInput.endsWith('/') || userInput.endsWith('x') || userInput.endsWith('-') || userInput.endsWith('+') || userInput.endsWith('.')){
      return false;
    }
    return true;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  // return the MyButton widget for the same button functionality
  MyButton button(int index){
    return MyButton(
      buttontapped: () {
        setState(() {
          if(checkSign()){
            userInput += buttons[index];
          }
        });
      },
      buttonText: buttons[index],
      color: Colors.deepPurpleAccent,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ), //AppBar
      body: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style:
                        const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GridView.builder(
                    itemCount: buttons.length,
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 1,
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput = '';
                              answer = '0';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                        );
                      }

                      // ^ button
                      else if (index == 1) {
                        return button(index);
                      }
                      // % Button
                      else if (index == 2) {
                        return button(index);
                      }
                      // Delete Button
                      else if (index == 3) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                        );
                      }
                      // Equal_to Button
                      else if (index == 18) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              if(checkSign()){
                                equalPressed();
                              }
                              else{
                                answer = "Wrong Input";
                              }

                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.orange[700],
                          textColor: Colors.white,
                        );
                      }

                      // other buttons 7 11 15 17 18
                      else {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              if(index == 7 || index == 11 || index == 15 || index == 17 || index == 19){
                                if(checkSign()){
                                  userInput += buttons[index];
                                }
                              }
                              else{
                                userInput += buttons[index];
                              }

                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black,
                        );
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
