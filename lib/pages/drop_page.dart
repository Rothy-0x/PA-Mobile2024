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
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop'),
      ),
      body: Center(
        child: Text('Drop Page Content for $_currentIndex'),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _currentIndex,
        onItemSelected: _onNavbarItemTapped,
      ),
    );
  }
}