import 'package:flutter/material.dart';
import 'package:skena/widgets/navbar.dart';
import 'package:skena/pages/drop_page.dart';
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _currentIndex = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Center(
        child: Text('News Page Content for $_currentIndex'),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _currentIndex,
        onItemSelected: _onNavbarItemTapped,
      ),
    );
  }
}