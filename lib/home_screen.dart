// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:loginfacebook/profile.dart';
import 'home_page.dart'; // Import widget HomePage
import 'onboarding_facebook.dart'; // Import widget FacebookAuthentication

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Chỉ số trang hiện tại trong BottomNavigationBar

  // Danh sách các widget cho từng tab
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(), // Trang Home
    ProfileScreen(), // Trang Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật trang khi người dùng chọn tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Hiển thị trang tương ứng với chỉ số
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Chỉ số của tab hiện tại
        onTap: _onItemTapped, // Lắng nghe sự kiện nhấn tab
      ),
    );
  }
}
