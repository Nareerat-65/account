import 'package:account/database/transaction_db.dart';
import 'package:flutter/foundation.dart';
import 'package:account/models/transactions.dart';

class TransactionProvider with ChangeNotifier{
  List<Transactions> transactions = [];
  
  List<Transactions> getTrasaction(){
    return transactions;
  }
  void addTransaction(Transactions transaction) async{
    var db = await TransactionDB(dbName: 'transaction.db').openDatabase();
    transactions.insert(0, transaction);
    notifyListeners();
  } 
  void deleteTrasaction(int index){
    transactions.removeAt(index);
    notifyListeners();
  }
}

