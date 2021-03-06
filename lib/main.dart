import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';

import './utils/app_routes.dart';
import './views/product_detail_screen.dart';
import './views/products_overview_screen.dart';
import './views/cart_screen.dart';
import './views/orders_screen.dart';
import './views/products_screen.dart';
import './views/product_form_screen.dart';
import './views/auth_home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
         create: (_) => new Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => new Products(),
         update: (ctx, auth, previousProducts) => new Products(auth.token, auth.userId, previousProducts.items),
        ),
        ChangeNotifierProvider(
         create: (_) => new Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
         create: (_) => new Orders(),
         update: (ctx, auth, previousOrders ) => new Orders(auth.token, auth.userId, previousOrders.items),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        // home: ProductOverviewScreen(),
        routes: {
          AppRoutes.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
          AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrdersScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}


// # Conclusão do Capílo 8 - Gerenciamento de Estado.
// # Conclusão do Capílo 9 - Trabalhando com Formulários
// # Conclusão do Capílo 10 - Enviando Requisições HTTP
// # Conclusão do Capílo 11 - Adicionando Autenticação