
import 'package:cartitem_blocksample_app/models/product.dart';

class ProductService{

  static List<Product> products= new List<Product>();

  //yapıları static oluşturmamızın sebebi ->ProductService.getAll şeklinde kullanabilmek için
  //Singleton mimari için başlangıç
  static ProductService _singleton =ProductService._internal();

  factory ProductService(){
    return _singleton;
  }
  ProductService._internal();
  //bitiş


  static List<Product> getAll(){
    products.add(Product(1,"A Laptop",9000));
    products.add(Product(2,"B Laptop",3000));
    products.add(Product(3,"C Laptop",5000));
    products.add(Product(4,"D Laptop",4000));
    products.add(Product(5,"H Laptop",8000));
    return products;
  }
}