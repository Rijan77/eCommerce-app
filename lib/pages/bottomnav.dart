import 'package:ecommerce_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'home.dart';
import 'order.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavState();
  }
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;

  late Home Homepage;
  late Order order;
  late Profile profile;

  int currentTabIndex = 0;

  @override
  void initState() {
    Homepage = const Home();
    order = const Order();
    profile = const Profile();
    pages = [Homepage, order, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            height: 65,
            backgroundColor: const Color(0xfff2f2f2),
            color: Colors.black87,
            animationDuration: const Duration(microseconds: 500),
            onTap: (int index){
              setState(() {
                currentTabIndex = index;
              });
            },
            items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          )
        ]),
      body: pages[currentTabIndex],

    );
  }
}
