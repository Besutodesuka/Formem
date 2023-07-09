import 'package:flutter/material.dart';

class Calculatorview extends StatefulWidget {
  final List Variable;
  Calculatorview({super.key, required this.Variable});
  @override
  State<Calculatorview> createState() => _CalculatorviewState(Variable);
}

class _CalculatorviewState extends State<Calculatorview> {
  List Variable;
  _CalculatorviewState(this.Variable);
  String equation = "0";
  String validate = "0";
  String expression = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalAppbar(),
      body: Column(children: [
        // formula form
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            equation,
            style: TextStyle(fontSize: 38),
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
        Expanded(child: Divider()),
        Container(
          padding: EdgeInsets.only(bottom: 20, left: 10),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Variable.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: FloatingActionButton(
                      child: Text(Variable[index][0]),
                      onPressed: () => TypePressed(Variable[index][0])),
                );
              },
            ),
          ),
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
                      text: '⌫',
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.brown.shade300,
                    ),
                    TypoButton(
                      text: '÷',
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
                      height: MediaQuery.of(context).size.height * 0.1 * 2,
                      color: Colors.brown,
                    ),
                  ])
                ],
              ),
            )
          ],
        )
      ]),
    );
  }

  List Expression = ['x', '-', '+', '÷'];
  void TypePressed(String buttontext) {
    setState(() {
      if (buttontext == '✓') {
        // validate
        // push to box
      } else if (buttontext == 'C') {
      } else if (buttontext == '⌫') {
      } else if (Expression.contains(buttontext)) {
      } else {}
    });
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
