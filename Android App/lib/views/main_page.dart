import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/views/pages_handler.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        onTap: (index) {
          setState(
            () {
              _page = index;
            },
          );
        },
        color: kNavBarColor,
        buttonBackgroundColor: kMainColor,
        backgroundColor: kMainColor,
        items: [
          Icon(Icons.notifications_active, size: 30, color: kButtonNavBarColor),
          Icon(Icons.add, size: 30, color: kButtonNavBarColor),
          Icon(Icons.person, size: 30, color: kButtonNavBarColor),
        ],
      ),
      body: Container(
        child: screens[_page],
      ),
    );
  }
}