import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/error_screen.dart';
import '../providers/auth.dart';
import '../views/auth_screen.dart';
import '../views/products_overview_screen.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return FutureBuilder(
        future: auth.tryAutoLogin(),
        builder: (ctx, snaphop) {
          if (snaphop.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if(snaphop.error != null) {
            return ErrorScreen(snaphop.error.toString());
          } else {
            return auth.isAuth ? ProductOverviewScreen() : AuthScreen();
          }
        },
      );
  }
}
