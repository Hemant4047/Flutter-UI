import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final tapHandler;
  final currIndex;
  CustomAppBar({@required this.tapHandler, @required this.currIndex});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.amber),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: Color(0XFFF47D15),
      selectedLabelStyle: TextStyle(color: Color(0XFFF47D15)),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Deals',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
      ],
      currentIndex: currIndex,
      onTap: tapHandler,
    );
  }
}
