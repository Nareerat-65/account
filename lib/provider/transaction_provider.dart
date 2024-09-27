import 'package:account/database/transaction_db.dart';
import 'package:flutter/foundation.dart';
import 'package:account/models/transactions.dart';

class TransactionProvider with ChangeNotifier{
  List<Transactions> transactions = [];
  
  List<Transactions> getTrasaction(){
    return transactions;
  }
  void addTransaction(Transactions transaction) async{
    var db = await TransactionDB(dbName: 'transaction.db');
    var keyID = await db.insertDatabase(transaction);
    this.transactions = await db.loadAllData();
    notifyListeners();
  } 
  void deleteTrasaction(int index){
    transactions.removeAt(index);
    notifyListeners();
  }
}

