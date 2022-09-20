import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:love_calcu/menu.dart';

import 'calculator_component/style/style.dart';


class MainControlWidget extends StatefulWidget {
  const MainControlWidget({Key? key}) : super(key: key);

  @override
  State<MainControlWidget> createState() => _MainControlWidgetState();
}

class _MainControlWidgetState extends State<MainControlWidget>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  List tabItems = [
    const MyMenuScreen(),
    const MyMenuScreen(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItems[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: kWhiteColor,
        selectedIndex: _selectedIndex,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.door_back_door),
            title: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
