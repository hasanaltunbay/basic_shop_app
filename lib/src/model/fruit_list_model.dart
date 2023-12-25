import 'package:flutter/material.dart';

class FruitListModel extends ChangeNotifier {
  final List _fruitList = [
    ["Apple", "4.00", "assets/apple.jpeg", Colors.red],
    ["Banana", "15.00", "assets/banana.jpeg", Colors.yellow],
    ["Cherry", "6.00", "assets/cherry.jpeg", Colors.deepPurple],
    ["Kiwi", "8.00", "assets/kiwi.jpeg", Colors.blue],
    ["Orange", "9.50", "assets/orange.jpeg", Colors.orange],
    ["Pomegranate", "10.25", "assets/pomegranate.jpeg", Colors.green],
  ];

  get fruitList => _fruitList;

  List _cartList = [];

  get cartList => _cartList;

  void addCard(int index) {
    _cartList.add(_fruitList[index]);
    notifyListeners();
  }

  void deleteCard(int index) {
    _cartList.removeAt(index);
    notifyListeners();
  }

  String totalPrice() {
    double totalPrice = 0;
    for (var i = 0; i < _cartList.length; i++) {
      totalPrice = totalPrice + double.parse(_cartList[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
