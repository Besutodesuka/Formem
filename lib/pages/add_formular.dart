import 'package:flutter/material.dart';
import 'package:formem/pages/calculator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widget/addvar_dialog_box.dart';
import '../widget/variable_tile.dart';

class AddFormula extends StatefulWidget {
  const AddFormula({super.key});

  @override
  State<AddFormula> createState() => _AddFormulaState();
}

class _AddFormulaState extends State<AddFormula> {
  // ref to db
  final _NameController = TextEditingController();
  final _UnitController = TextEditingController();
  final _FormulaController = TextEditingController(text: '');
  final _formulaBox = Hive.box('formula');

  List TempVariable = [];
  var FormNameController = TextEditingController();
  // write data
  void writeData(String key, List value) {
    /* # schema is
    
    */
    _formulaBox.put(key, value);
  }

  // Read data
  void readData(int key) {
    _formulaBox.get(key);
  }

  void SaveNewVariable() {
    if (_NameController.text != '' && _UnitController.text != '') {
      setState(() {
        TempVariable.add([_NameController.text, _UnitController.text]);
      });
      _NameController.text = '';
      _UnitController.text = '';
      Navigator.of(context).pop();
    }
    // alert no filled
  }

  void SaveNewFormula() {
    // TempVariable.insert(0, '');
    // writeData(FormNameController.text, TempVariable);
  }

  void createNewVar() {
    showDialog(
        context: context,
        builder: (context) {
          return addvarAlert(
            OnSave: SaveNewVariable,
            OnCancel: () => Navigator.of(context).pop(),
            NameController: _NameController,
            UnitController: _UnitController,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddformAppbar(),
      body: Column(children: [
        // Container(child: Text('Name')),
        Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: TextField(
            controller: FormNameController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: const Icon(
                  Icons.document_scanner_outlined,
                  color: Colors.black87,
                  size: 25.0,
                ),
                hintText: 'formula name',
                filled: true,
                fillColor: Colors.green[50],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
        ),
        // add var form
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20),
                child: const Text(
                  'Variable',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10, left: 5),
                  child: GestureDetector(
                      child: const Icon(Icons.add_outlined),
                      onTap: createNewVar))
            ],
          ),
        ),
        Container(
          height: 300,
          child: TempVariable.isNotEmpty
              ? ListView.builder(
                  itemCount: TempVariable.length,
                  itemBuilder: (context, index) {
                    return VarTile(
                        Name: TempVariable[index][0],
                        Unit: TempVariable[index][1]);
                  },
                )
              : const Center(child: Text('No items')),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: const Text(
            'Formula',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        //custom keybard
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => Calculatorview(
                          Variable: TempVariable,
                        )),
              );
            },
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 20, bottom: 50),
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Row(children: [Icon(Icons.equalizer), Text('equation')]),
                  Text('')
                ],
              ),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
        tooltip: 'press here to add more formula',
        onPressed: SaveNewFormula,
        child: const Icon(Icons.check),
      ),
    );
  }

  AppBar AddformAppbar() {
    return AppBar(
      title: const Text(
        'Formular Memory',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
