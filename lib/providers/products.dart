import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../data/dummy_data.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  void addProduct(Product newProduct) {
    _items.add(Product(
      id: Random().nextDouble().toString(),
      title: newProduct.title,
      price: newProduct.price,
      description: newProduct.description,
      imageUrl: newProduct.imageUrl
    ));
    notifyListeners();
  }

  int get itemsCount {
    return _items.length;
  }
}










// ### Provider para controle na aplicação inteira.
// bool _showFavoriteOnly = false;

//  List<Product> get items {
//   if(_showFavoriteOnly){
//     return _items.where((prod) => prod.isFavorite).toList();
//   }
//   return [ ..._items ];
// }

// void showFavoriteOnly() {
//   _showFavoriteOnly = true;
//   notifyListeners();
// }

// void showAll() {
//   _showFavoriteOnly = false;
//   notifyListeners();
// }
