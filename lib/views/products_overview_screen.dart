import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Product> loadedProducts = products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        centerTitle: true,
      ),
      body: ProductGrid(),
    );
  }
}

