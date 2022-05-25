import 'package:flutter/material.dart';
import 'package:news/book_mark.dart';
import 'package:news/home.dart';

class TabBarScreen extends StatefulWidget {
  // const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectItem = 0;

  final _pages = [
    Home(),
    BookMark(),
    // ProductPage(),
    // Expeness(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),

      //   BODY
      body: Center(
        child: _pages[_selectItem],
      ),
      //   BOTTOM BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectItem,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            // title: Text('Home'),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            // title: Text('Customer'),
            label: 'Customer',
            backgroundColor: Colors.blue,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.production_quantity_limits),
          //   // title: Text('Customer'),
          //   label: 'Product',
          //   backgroundColor: Colors.blue,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.event_available_outlined),
          //   // title: Text('Expenses'),
          //   label: 'Expenses',
          //   backgroundColor: Colors.blue,
          // ),
        ],
        fixedColor: Colors.grey.shade800,
        onTap: (index) {
          setState(() {
            _selectItem = index;
          });
        },
      ),
    );
  }
}
