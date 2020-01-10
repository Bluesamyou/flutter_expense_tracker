import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Price",
                ),
                controller: amountController,
              ),
              FlatButton(
                child: Text(
                  "Add transaction",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {
                  // print(titleController.text);
                  addNewTransaction(
                    titleController.text,
                    double.parse(amountController.text),
                  );

                  print("pressed");
                },
              )
            ],
          )),
    );
  }
}
