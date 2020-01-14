import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/transaction.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionList {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount.toInt();
        }
      }

      print({
        "day": DateFormat.E().format(weekday),
        "amount": totalSum,
      });

      return {
        "day": DateFormat.E().format(weekday),
        "amount": totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionList);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
