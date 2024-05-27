import 'package:flutter/material.dart';
import 'package:skena/pages/news_page.dart';
import 'package:skena/pages/drop_page.dart';

void main() {
  runApp(Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/': (context) => NewsPage(),
        '/drop': (context) => DropPage(),
      },
    );
  }
}