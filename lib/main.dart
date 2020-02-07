import 'package:epense_tracker_app/widgets/chart.dart';
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
      title: "Expenses Tracker",
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.green,
        fontFamily: "Montserrat",
        textTheme: TextTheme(
            title: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "Lato",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
  void _addNewTransaction(String txName, double txPrice, DateTime txDate) {
    final newTx =
        Transaction(itemName: txName, itemPrice: txPrice, itemDate: txDate);
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

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.itemDate.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  List<Transaction> _userTransactions = [
//    Transaction(
//        itemName: "Groceries", itemPrice: 12.50, itemDate: DateTime.now()),
//    Transaction(itemName: "Watch", itemPrice: 100.50, itemDate: DateTime.now()),
//    Transaction(itemName: "Jacket", itemPrice: 42.50, itemDate: DateTime.now()),
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
            Chart(_recentTransactions),
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
