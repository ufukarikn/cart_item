import 'package:cartitem_blocksample_app/screens/cart_item_screen.dart';
import 'package:cartitem_blocksample_app/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: {
        "/": (BuildContext context) => ProductListScreen(),
        "/cartItem": (context) => CartItemScreen(),
      },
      initialRoute: "/",
    );
  }
}