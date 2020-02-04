import 'package:epense_tracker_app/widgets/new_transaction.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';

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
      home: ExpensePage(),
    );
  }
}

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  void _addNewTransaction(String txName, double txPrice) {
    final newTx = Transaction(
        itemName: txName, itemPrice: txPrice, itemDate: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _showAddTransaction(BuildContext bCtx) {
    showModalBottomSheet(
        backgroundColor: Colors.green.shade500,
        context: bCtx,
        builder: (ctx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  List<Transaction> _userTransactions = [
    Transaction(
        itemName: "Groceries", itemPrice: 12.50, itemDate: DateTime.now()),
    Transaction(itemName: "Watch", itemPrice: 100.50, itemDate: DateTime.now()),
    Transaction(itemName: "Jacket", itemPrice: 42.50, itemDate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Tracker"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showAddTransaction(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              width: double.infinity,
              child: Card(
                child: Text("Expense Tracker Chart"),
                elevation: 5.0,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTransaction(context);
        },
        child: Icon(Icons.add),
        splashColor: Colors.grey,
      ),
    );
  }
}
