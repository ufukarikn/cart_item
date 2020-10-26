import 'dart:async';

import 'package:cartitem_blocksample_app/data/cart_item_service.dart';
import 'package:cartitem_blocksample_app/models/cart_item.dart';



class CartItemBloc{
  var cartItemStreamController=StreamController.broadcast();

  Stream get getStream =>cartItemStreamController.stream;

  void addToCardItem(CartItem item){
    CartItemService.addToCartItems(item);
    cartItemStreamController.sink.add(CartItemService.getCartItems());
  }

  void removeFromCardItem(CartItem item){
    CartItemService.removeFromCartItems(item);
    cartItemStreamController.sink.add(CartItemService.getCartItems());
  }

  List<CartItem> getCart(){
    return CartItemService.getCartItems();
  }
}

 final cartItemBloc= CartItemBloc();