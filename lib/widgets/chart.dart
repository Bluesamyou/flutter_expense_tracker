import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/transaction.dart";
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionList {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekday).substring(0, 1),
        "amount": totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionList.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionList);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionList.map((data) {
          return ChartBar(
            data['day'],
            data['amount'],
            (data['amount'] as double) / totalSpending,
          );
        }).toList(),
      ),
    );
  }
}
