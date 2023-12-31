import 'dart:ffi';

import 'package:flutter/material.dart';

class VarTile extends StatelessWidget {
  final String Name;
  final String Unit;
  const VarTile({super.key, required this.Name, required this.Unit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green[50], borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(Name),
          Text('Unit :' + Unit),
          GestureDetector(
            child: Icon(Icons.delete),
          )
        ]),
      ),
    );
  }
}
