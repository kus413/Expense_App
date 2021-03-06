import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemNameController = new TextEditingController();
  final itemPriceController = new TextEditingController();
  DateTime _selectedDateTime;

  void submitData() {
    final enteredName = itemNameController.text;
    final enteredPrice = double.parse(itemPriceController.text);
    if (enteredName.isEmpty || enteredPrice < 0 || _selectedDateTime == null) {
      return;
    }
    widget.addTx(enteredName, enteredPrice, _selectedDateTime);
    Navigator.pop(context);
  }

  void _showDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        _selectedDateTime = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDateTime == null
                        ? "No date entered"
                        : "Picked Date : ${DateFormat.yMd().format(_selectedDateTime)}",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Choose a date",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: _showDate,
                )
              ],
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
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
