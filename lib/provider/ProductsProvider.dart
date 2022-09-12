import 'package:flutter/cupertino.dart';
import 'package:global_fair_assignment/dataList.dart';

import '../Model/Product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void getData(int offset, int limit) {
    for (int i = offset; i < offset + limit && i < dataList.length; i++) {
      _products.add(dataList[i]);
    }
    notifyListeners();
  }

  void updatePrice(int id, double price) {
    _products.forEach((element) {
      if (element.id == id) {
        element.price = price;
      }
    });
    notifyListeners();
  }
}
