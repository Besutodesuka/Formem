import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

class Calculatorview extends StatefulWidget {
  final List Variable;
  final TextEditingController Equation_Text;
  Calculatorview(
      {super.key, required this.Variable, required this.Equation_Text});
  @override
  State<Calculatorview> createState() =>
      _CalculatorviewState(Variable, Equation_Text);
}

class _CalculatorviewState extends State<Calculatorview> {
  List Variable;
  TextEditingController Equation_Text;
  _CalculatorviewState(this.Variable, this.Equation_Text);

  String equation = "0";
  String validate = "valid";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalAppbar(),
      body: SingleChildScrollView(
        child: Column(children: [
          // formula form
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(fontSize: 38),
              ),
            ),
          ),
          // validator
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              validate,
              style: TextStyle(fontSize: 48),
            ),
          ),
          const Expanded(child: Divider()),
      
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20, left: 10),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Variable.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                        ),
                        child: FloatingActionButton(
                            child: Text(Variable[index][0]),
                            onPressed: () => TypePressed(Variable[index][0])),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: 40,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid)),
                      onPressed: () => TypePressed('⌫'),
                      child: Text(
                        '⌫',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    )),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      TypoButton(
                        text: 'C',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.brown,
                      ),
                      TypoButton(
                        text: '(',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.brown.shade300,
                      ),
                      TypoButton(
                        text: ')',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.brown.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: '7',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '8',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '9',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: '4',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '5',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '6',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: '1',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '2',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '3',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: '.',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '0',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                      TypoButton(
                        text: '^',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.green.shade300,
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      TypoButton(
                        text: '÷',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.brown.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: 'x',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.brown.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: '-',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.brown.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: '+',
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.brown.shade300,
                      ),
                    ]),
                    TableRow(children: [
                      TypoButton(
                        text: '✓',
                        height: MediaQuery.of(context).size.height * 0.1 * 1,
                        color: Colors.brown,
                      ),
                    ])
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  List explist = ['x', '-', '+', '÷'];

  bool Validate(String equation) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(equation);

      ContextModel cm = ContextModel();
      exp.evaluate(EvaluationType.REAL, cm);
      return true;
    } catch (e) {
      return false;
    }
  }

  void VarPress(int index){

  }

  void TypePressed(String buttontext) {
    setState(() {
      if (buttontext == '✓') {
        // validate
        equation = equation.replaceAll('x', '*');
        equation = equation.replaceAll('÷', '/');
        if (Validate(equation)) {
          // set text of equation on Add form as we organized in this form
          Equation_Text.text = equation;
          // return to formula add Screen
          Navigator.of(context).pop();
        }
        // push to box
      } else if (buttontext == 'C') {
        equation = "0";
        validate = "invalid";
      } else if (buttontext == '⌫') {
        if (equation.length == 1) {
          equation = "0";
        } else {
          equation = equation.substring(0, equation.length - 1);
        }
      }
      // else if (explist.contains(buttontext)) {
      // }
      else {
        // number
        if (equation == "0") {
          equation = buttontext;
        } else {
          equation = equation + buttontext;
        }
      }
    }
    // validate
      if (Validate(equation)) {
        validate = "valid";
      } else {
        validate = "invalid";
      }
    );
  }

  Container TypoButton(
      {required Color color, required double height, required String text}) {
    return Container(
      height: height,
      color: color,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
            side: const BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        onPressed: () => TypePressed(text),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }

  AppBar CalAppbar() {
    return AppBar(
      title: const Text(
        'Formula Form',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
