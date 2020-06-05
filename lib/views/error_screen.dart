import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String msg;

  const ErrorScreen(this.msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.red.shade200,size: 50,),
            SizedBox(height: 30),
            Text('Erro: $msg', style: TextStyle(color: Colors.red.shade900),),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
