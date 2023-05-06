import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/category_card.dart';
import 'package:hack/column.dart';
import 'package:hack/onboarding_screen.dart';
import 'package:hack/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List imagelist = [
    {"id": 1, "image_path": 'assets/images/3.jpg'},
    {"id": 2, "image_path": 'assets/images/12.jpg'},
    {"id": 3, "image_path": 'assets/images/1.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello,",
                        style: GoogleFonts.notoSansMono(
                            textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.greenAccent[700],
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 197, 229, 204),
                            ),
                          ],
                        ))),
                    Text(name,
                        style: GoogleFonts.notoSansMono(
                            textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.greenAccent[700],
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 3.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 197, 229, 204),
                            ),
                          ],
                        )))
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                        onTap: () async {
                          final pref = await SharedPreferences.getInstance();
                          pref.setBool('showHome', false);
                          name = "";
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return onBoardingScreen();
                          }));
                        },
                        child: Icon(Icons.logout)))
              ],
            ),
          ),
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print("current index");
                },
                child: CarouselSlider(
                    items: imagelist
                        .map((item) => Padding(
                              padding: EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 1.3,
                        viewportFraction: 0.95,
                        onPageChanged: ((index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }))),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text("Let's Recycle",
                style: GoogleFonts.notoSansMono(
                    textStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 3.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 197, 229, 204),
                          ),
                        ],
                        color: Colors.greenAccent[700]))),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.green[50],
                      context: context,
                      builder: (context) {
                        return Mycol(
                            text:
                                "Organic waste is any material that is biodegradable and comes from either a plant or an animal. Biodegradable waste is organic material that can be broken into carbon dioxide, methane or simple organic molecules.",
                            iconimage: "assets/images/oragnic.jpeg",
                            cat: "Organic waste");
                        cat:
                        "Organic waste";
                      },
                    );
                  },
                  child: Category_card(
                    categoryname: "Organic waste",
                    iconImage: "assets/images/4.png",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Mycol(
                          text: "hello",
                          iconimage: "assets/images/4.png",
                          cat: "Organic waste",
                        );
                      },
                    );
                  },
                  child: Category_card(
                    categoryname: "Electronic Waste",
                    iconImage: "assets/images/5.png",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Mycol(
                          text: "hello",
                          iconimage: "assets/images/4.png",
                          cat: "Organic waste",
                        );
                      },
                    );
                  },
                  child: Category_card(
                    categoryname: "Batteries",
                    iconImage: "assets/images/6.png",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Mycol(
                            text: "hello",
                            iconimage: "assets/images/4.png",
                            cat: "Organic waste");
                      },
                    );
                  },
                  child: Category_card(
                    categoryname: "cloths",
                    iconImage: "assets/images/7.png",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Mycol(
                            text: "hello",
                            iconimage: "assets/images/4.png",
                            cat: "Organic waste");
                      },
                    );
                  },
                  child: Category_card(
                    categoryname: "glass",
                    iconImage: "assets/images/9.png",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Mycol(
                            text: "hello",
                            iconimage: "assets/images/4.png",
                            cat: "Organic waste");
                      },
                    );
                  },
                  child: Category_card(
                    categoryname: "Medical Waste",
                    iconImage: "assets/images/10.png",
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
