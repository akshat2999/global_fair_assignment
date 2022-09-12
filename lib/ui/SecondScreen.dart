import 'package:flutter/material.dart';
import 'package:global_fair_assignment/provider/ProductsProvider.dart';
import 'package:provider/provider.dart';

import '../Model/Product.dart';

class SecondScreen extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    _textController.text = product.price.toString();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text("Change Price :",style: TextStyle(fontSize: 30),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'price...',
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.amberAccent,
      content: Text("Price Updated !"),
    ));
                  Provider.of<ProductsProvider>(context,listen: false).updatePrice(
                      product.id, double.parse(_textController.text));
                      
                },
                child: Text("Update Value"))
          ])),
    );
  }
}
