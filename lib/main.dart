import 'package:epense_tracker_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          splashColor: Colors.grey,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Expenses Tracker"),
          centerTitle: true,
        ),
        body: ExpensePage(),
      ),
    );
  }
}

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  String nameItem;
  String priceItem;

  List<Transaction> transactions = [
    Transaction(
        itemName: "Groceries", itemPrice: 12.50, itemDate: DateTime.now()),
    Transaction(itemName: "Watch", itemPrice: 100.50, itemDate: DateTime.now()),
    Transaction(itemName: "Jacket", itemPrice: 42.50, itemDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          width: double.infinity,
          child: Card(
            child: Text("Expense Tracker Chart"),
            elevation: 5.0,
          ),
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Item Name"),
                  cursorColor: Colors.green,
                  onChanged: (value) {
                    nameItem = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Item Price"),
                  cursorColor: Colors.green,
                  onChanged: (value) {
                    priceItem = value;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      transactions.add(Transaction(
                          itemPrice: double.parse(priceItem),
                          itemName: nameItem,
                          itemDate: DateTime.now()));
                    });
                  },
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
        ),
        Column(
          children: transactions.map((tx) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '\$' + tx.itemPrice.toString(),
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          tx.itemName,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          DateFormat.yMMMEd().format(tx.itemDate),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
