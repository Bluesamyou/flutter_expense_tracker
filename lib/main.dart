import 'package:flutter/material.dart';

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

  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
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
