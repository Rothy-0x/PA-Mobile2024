import 'package:flutter/material.dart';
import 'package:skena/widgets/navbar.dart';
import 'package:skena/pages/news_page.dart';
// import 'package:skena/pages/saved_page.dart';
// import 'package:skena/pages/account_page.dart';

class DropPage extends StatefulWidget {
  const DropPage({super.key});

  @override
  State<DropPage> createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
int _currentIndex = 1;
void _onNavbarItemTapped(int index) {
  

    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DropPage()));
        break;
      // case 2:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => SavedPage()));
      //   break;
      // case 3:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
      //   break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drops'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'POPULAR'),
              Tab(text: 'UPCOMING'),
              Tab(text: 'RELEASED'),
              Tab(text: 'JUST ADDED'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality here
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            ProductGrid(),
            ProductGrid(),
            ProductGrid(),
            ProductGrid(),
          ],
        ),
        bottomNavigationBar: CustomNavbar(
            currentIndex: _currentIndex,
            onItemSelected: _onNavbarItemTapped,
          ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(8.0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: const [
        ProductItem(
          imageUrl: 'assets/images/yeezy.png',
          name: 'YEEZY BOOST 350 V2 "Glow-in-the-Dark"',
          date: 'May 24, 2019',
        ),
        ProductItem(
          imageUrl: 'https://example.com/burberry.jpg',
          name: 'Thomas Burberry Monogram Collection',
          date: 'May 22, 2019',
        ),
        ProductItem(
          imageUrl: 'https://example.com/versace.jpg',
          name: 'Versace Gold Greek Thin Ring',
          date: 'May 23, 2019',
        ),
        ProductItem(
          imageUrl: 'https://example.com/supreme.jpg',
          name: 'Supreme Spring/Summer 2019 Collection Drop 13',
          date: 'May 25, 2019',
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String date;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(date),
          ),
        ],
      ),
    );
  }
}