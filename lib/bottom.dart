import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hack/about.dart';
import 'package:hack/home.dart';
import 'package:hack/homepage1.dart';
import 'package:hack/intropage1.dart';
import 'package:hack/onboarding_screen.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => BottomState();
}

class BottomState extends State<Bottom> {
  int _index = 0;
  final screens = [homepage(), Home()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      body: screens[_index],
      bottomNavigationBar: GNav(
          // rippleColor: Color.fromARGB(255, 174, 238, 176),
          backgroundColor: Colors.green.shade50,
          hoverColor: Color.fromARGB(255, 174, 238, 176),
          gap: 8,
          selectedIndex: _index,
          iconSize: 22,
          onTabChange: (index) {
            setState(() {
              _index = index;
            });
          },
          curve: Curves.easeInOut,
          color: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
          duration: Duration(milliseconds: 900),
          activeColor: Color.fromARGB(255, 82, 167, 86),
          tabs: [
            GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.upload_file, text: "Upload"),
          ]),
    );
  }
}
