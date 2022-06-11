import 'package:budget_tracker/model/transaction_item.dart';
import 'package:budget_tracker/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class BudgetViewModel extends ChangeNotifier {
  // => BudgetViewModel
  //BudgetViewModel();

  double getBudget() => LocalStorageService().getBudget();

  double getBalance() => LocalStorageService().getBalance();

  // List<TransactionItem> _items = [];

  List<TransactionItem> get items => LocalStorageService().getAllTransactions();

  set budget(double value) {
    LocalStorageService().saveBudget(value);
    notifyListeners();
  }

  void addItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    localStorage.saveTransactionItem(item);
    notifyListeners();
  }

  void deleteItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    // Call our localstorage service to delete the item
    localStorage.deleteTransactionItem(item);
    // Notify the listeners
    notifyListeners();
  }
}
