
import 'package:cartitem_blocksample_app/models/cart_item.dart';

class CartItemService{

  static List<CartItem> cartItems = List<CartItem>();

  //Singleton mimari:

  static CartItemService _singleton=CartItemService._internal();

  factory CartItemService(){
    return _singleton;
  }

  CartItemService._internal();

  static void addToCartItems(CartItem item){
    cartItems.add(item);
  }

  static void removeFromCartItems(CartItem item){
    cartItems.remove(item);
  }

  static List<CartItem> getCartItems(){
    return cartItems;
  }
}