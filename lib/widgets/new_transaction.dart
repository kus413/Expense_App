import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemNameController = new TextEditingController();
  final itemPriceController = new TextEditingController();

  void submitData() {
    final enteredName = itemNameController.text;
    final enteredPrice = double.parse(itemPriceController.text);
    if (enteredName.isEmpty || enteredPrice < 0) {
      return;
    }
    widget.addTx(enteredName, enteredPrice);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Item Name"),
              controller: itemNameController,
              cursorColor: Colors.green,
              onSubmitted: (_) {
                submitData();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Item Price"),
              controller: itemPriceController,
              cursorColor: Colors.green,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submitData();
              },
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
