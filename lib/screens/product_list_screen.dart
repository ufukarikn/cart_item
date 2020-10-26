
import 'package:cartitem_blocksample_app/blocs/cart_item_bloc.dart';
import 'package:cartitem_blocksample_app/blocs/product_bloc.dart';
import 'package:cartitem_blocksample_app/models/cart_item.dart';
import 'package:flutter/material.dart';
class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SampleBlocWith(StreamBuilder)",style: TextStyle(color: Colors.white,fontSize: 15),),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: ()=>Navigator.pushNamed(context, "/cartItem"),
          ),
        ],
      ),
      body: _buildProductList(),
    );
  }

  _buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAllProduct(),
        stream: productBloc.getStream,
        builder:(context,snapshot){
        return snapshot.data.length>0 ?_buildListView(snapshot) : Center(child: CircularProgressIndicator());
        });
  }

  _buildListView(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context,index){
      final list=snapshot.data;
      return ListTile(
        title:Text(list[index].name),
        subtitle: Text(list[index].price.toString()),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: ()=>cartItemBloc.addToCardItem(CartItem(list[index],1)),
        ),
      );
    });
  }
}
