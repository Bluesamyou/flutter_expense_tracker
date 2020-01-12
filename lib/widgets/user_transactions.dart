import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import "../models/transaction.dart";

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      id: "01",
      title: "Adidas Shoes",
      amount: 25.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "01",
      title: "Groceries",
      amount: 60.54,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(
    String title,
    double amount,
  ) {
    var newTransaction = new Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
