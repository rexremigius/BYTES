// ignore: unused_import
import 'package:bytes/constant.dart';
import 'package:bytes/tabs/account_tab.dart';
import 'package:bytes/tabs/cart_tab.dart';
import 'package:bytes/tabs/home_tab.dart';
import 'package:bytes/tabs/search_tab.dart';
import 'package:bytes/widgets/bottom_tabs.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent[700],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Expanded(
                child: PageView(
                  controller: _tabsPageController,
                  onPageChanged: (num) {
                    setState(() {
                      _selectedTab = num;
                    });
                  },
                  children: [
                    HomeTab(),
                    SearchTab(),
                    CartTab(),
                    AccountTab(),
                  ],
                ),
              ),
            ),
            BottomTab(
              selectedTab: _selectedTab,
              tabPressed: (num) {
                _tabsPageController.animateToPage(num,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInCubic);
              },
            ),
          ],
        ));
  }
}
