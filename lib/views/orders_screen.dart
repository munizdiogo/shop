import 'package:flutter/material.dart';
import 'package:shop/widgets/order_widget.dart';
import '../providers/orders.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).loadOrders(),
        builder: (ctx, snaphop) {
          if (snaphop.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if(snaphop.error != null) {
            return Center(child: Text('Ocorreu um erro inesperado.'));
          } else {
            return Consumer<Orders>(
              builder: (ctx, orders, child) {
                return ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
