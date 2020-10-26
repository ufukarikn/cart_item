import 'dart:async';

import 'package:cartitem_blocksample_app/models/product.dart';
import 'package:cartitem_blocksample_app/data/product_service.dart';

class ProductBloc{
  final productStreamController=StreamController.broadcast();

  //_productStreamController ise getter ,get productStreamController => productStreamController

  Stream get getStream => productStreamController.stream;

  List<Product> getAllProduct(){
    return ProductService.getAll();
  }

}
final productBloc =ProductBloc();