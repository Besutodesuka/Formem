import 'package:flutter/material.dart';

class addvarAlert extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final NameController;
  final UnitController;
  VoidCallback OnSave;
  VoidCallback OnCancel;

  addvarAlert({
    super.key,
    required this.NameController,
    required this.UnitController,
    required this.OnSave,
    required this.OnCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlertDialog(
        backgroundColor: Colors.yellow[100],
        content: Container(
          height: 200,
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: NameController,
                  decoration: InputDecoration(hintText: 'Variable Name'),
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: UnitController,
                decoration: InputDecoration(hintText: 'Unit'),
              ),
            ),
            //Button
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: Text('cancel'),
                  onPressed: OnCancel,
                ),
                MaterialButton(
                  child: Text('save'),
                  onPressed: OnSave,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
