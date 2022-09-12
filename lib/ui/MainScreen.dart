import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_fair_assignment/Model/Product.dart';
import 'package:global_fair_assignment/provider/ProductsProvider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int offset = 0;
  int limit = 15;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getData();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getData();
      }
    });
  }

  _getData() {
    setState(() {
      isLoading = true;
    });
    Provider.of<ProductsProvider>(context, listen: false)
        .getData(offset, limit);
    offset += limit;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProductsProvider>(
          builder: (context, productProvider, child) {
        List<Product> products = productProvider.products;
        return ListView.builder(
            controller: _scrollController,
            itemCount: products.length,
            itemBuilder: (context, i) {
              if (isLoading && i == products.length-1) {
                return CupertinoActivityIndicator();
              }
              return Card(
                child: ListTile(
                  onTap: () => Navigator.pushNamed(context, '/second',arguments: products[i]),
                  title: Text(products[i].productName),
                  subtitle: Text(products[i].price.toString()),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              );
            });
      }),
    );
  }
}
