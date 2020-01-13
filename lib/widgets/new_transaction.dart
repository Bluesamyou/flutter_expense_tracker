import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitForm() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || double.parse(enteredAmount) <= 0) {
      return;
    }
    widget.addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
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
