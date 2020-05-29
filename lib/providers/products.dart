import 'package:flutter/cupertino.dart';
import '../data/dummy_data.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  void addProduct(Product product) {
    _items.add(product);
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
