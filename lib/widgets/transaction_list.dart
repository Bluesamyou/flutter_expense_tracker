import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/transaction.dart';
import "package:intl/intl.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(
                          color: Theme.of(context).primaryColorDark,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${transactions[index].amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          DateFormat.MMMMEEEEd()
                              .format(transactions[index].date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    )
                  ],
                ));
              },
              itemCount: transactions.length,
            )
          : Column(
              children: <Widget>[
                Text("No transactions",
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                  padding: EdgeInsets.all(5),
                )
              ],
            ),
    );
  }
}
