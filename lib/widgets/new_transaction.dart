import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  void submitForm() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || double.parse(enteredAmount) <= 0) {
      return;
    }
    addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );

    print("pressed");
  }

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
                onSubmitted: (_) => submitForm(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Price",
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitForm(),
              ),
              FlatButton(
                child: Text(
                  "Add transaction",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: submitForm,
              )
            ],
          )),
    );
  }
}
