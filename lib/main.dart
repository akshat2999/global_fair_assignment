import 'package:flutter/material.dart';
import 'package:global_fair_assignment/provider/ProductsProvider.dart';
import 'package:global_fair_assignment/ui/MainScreen.dart';
import 'package:global_fair_assignment/ui/SecondScreen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}