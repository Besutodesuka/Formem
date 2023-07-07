import 'package:flutter/material.dart';
import 'package:formem/pages/add_formular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.11),
                blurRadius: 40,
                spreadRadius: 0.0)
          ]),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black87,
                  size: 25.0,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
        ),
        // scroll view
      ]),
      floatingActionButton: FloatingActionButton(
        tooltip: 'press here to add more formula',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddFormula()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar homeAppbar() {
    return AppBar(
      title: const Text(
        'Formular Memory',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color.fromRGBO(169, 78, 250, 0.612),
      centerTitle: true,
      actions: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Icon(Icons.add),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          ),
          onTap: () {
            // pop up create tag
          },
        )
      ],
    );
  }
}
