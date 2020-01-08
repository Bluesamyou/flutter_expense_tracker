import 'package:flutter/material.dart';

import "./transaction.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Flutter App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<Transaction> transaction = [
    Transaction(
      id: "01",
      title: "New Shoes",
      amount: 125.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "01",
      title: "Groceries",
      amount: 60.54,
      date: DateTime.now(),
    )
  ];

  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Container(
                child: Text("Chart"),
                width: double.infinity,
              ),
              color: Colors.blueAccent,
              elevation: 5,
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              child: Container(
                child: Text("TX"),
                width: double.infinity,
                // color: Colors.white,
              ),
              color: Colors.redAccent,
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}
