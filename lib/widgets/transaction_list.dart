import 'package:epense_tracker_app/main.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "No expenses added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Expanded(
                  child: FlatButton(
//                    onPressed:(){ ep._showAddTransaction(context);},
                    child: Image.asset(
                      "assets/images/box.png",
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '\$' + transactions[index].itemPrice.toString(),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: Theme.of(context).accentColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              transactions[index].itemName,
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Container(
                            child: Text(
                              DateFormat.yMMMEd()
                                  .format(transactions[index].itemDate),
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
              },
            ),
    );
  }
}
