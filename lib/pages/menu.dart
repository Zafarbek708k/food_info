import 'package:flutter/material.dart';
import 'package:food_info/pages/favorite.dart';
import 'package:food_info/pages/profile.dart';
import 'home.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List <Widget> pages = [
    const Home(), const Favorite(), const Profile()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: " "),
        ],
      ),
    );
  }
}
