import 'package:flutter/material.dart';
import "package:intl/intl.dart";

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
  final List<Transaction> transactions = [
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

  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
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
          Card(
            elevation: 5,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Description"),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Price"),
                    ),
                    FlatButton(
                      child: Text(
                        "Add transaction",
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                      onPressed: () => {},
                    )
                  ],
                )),
          ),
          Column(
            children: transactions.map((transaction) {
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
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${transaction.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transaction.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        DateFormat.MMMMEEEEd().format(transaction.date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                      )
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
