import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selelectedValue) {
              setState(() {
                if (selelectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}

// ### Provider para controle na aplicação inteira.
// final Products products = Provider.of(context);

//  PopupMenuButton(
//             onSelected: (FilterOptions selelectedValue) {
//               if(selelectedValue == FilterOptions.Favorite){
//                 products.showFavoriteOnly();
//               } else {
//                 products.showAll();
//               }
//             },
//             itemBuilder: (_) => [
//               PopupMenuItem(
//                 child: Text('Somente favoritos'),
//                 value: FilterOptions.Favorite,
//               ),
//               PopupMenuItem(
//                 child: Text('Todos'),
//                 value: FilterOptions.All,
//               ),
//             ],
//           ),
