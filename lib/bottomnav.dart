import 'package:flutter/material.dart';
import 'package:localdatatodu/pages/home/contactpage.dart';
import 'package:localdatatodu/pages/home/creattask.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentindex = 0;
  List<Widget> pages = [
    const HomePage(),
    const ContactPage(),
  ];
  void ontap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentindex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: ontap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_emergency),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
