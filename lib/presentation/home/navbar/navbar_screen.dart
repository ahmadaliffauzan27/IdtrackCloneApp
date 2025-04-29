import 'package:ecommerce_app/presentation/home/dashboard/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_app/common/constants/images.dart';
import 'package:ecommerce_app/common/constants/colors.dart';

import '../../account/screen/account_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // const Text('Home'),
    DashboardScreen(),
    const Text('Cart'),
    // const Text('Account'),
    AccountScreen(),
  ];

  int _cartItemCount = 0; // Simpan jumlah item di keranjang secara lokal

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: PrimaryColor.pr10,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconHome)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: Text(
                _cartItemCount.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: const ImageIcon(
                AssetImage(Images.iconCart),
                color: Colors.black,
              ),
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconUser)),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
