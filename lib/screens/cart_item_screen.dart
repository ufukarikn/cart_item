import 'package:cartitem_blocksample_app/blocs/cart_item_bloc.dart';
import 'package:flutter/material.dart';

class CartItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SampleBlocWith(StreamBuilder)",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: StreamBuilder(
          initialData: cartItemBloc.getCart(),
          stream: cartItemBloc.getStream,
          builder: (context, snapshot) {
            return snapshot.data.length > 0
                ? _buildCartList(snapshot)
                : Center(
                    child: Text(
                      "Sepetinizde Ürün Bulunmamaktadır.",
                      style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 13),
                    ),
                  );
          }),
    );
  }
  _buildCartList(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final list = snapshot.data;
          return
            ListTile(
            leading: Text(list[index].quantity.toString()),
            title: Text(list[index].product.name),
            subtitle: Text(list[index].product.price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartItemBloc.removeFromCardItem(list[index]);
              },
            ),
          );
        });
  }
}
