import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/variables.dart';

class intropage3 extends StatelessWidget {
  const intropage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Center(
        child: Column(children: [
          Image.asset(
            "assets/images/19.png",
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
            child: Container(
              child: Text(
                "Together We Can:",
                style: GoogleFonts.notoSansMono(
                  color: widgitcolor,
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 15.0,
                      color: Color.fromARGB(255, 197, 229, 204),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 45, right: 35, top: 20, bottom: 2),
            child: Text(
              "We're on a mission to make the world a greener place, and we want you to be a part of our team! By using our app, you're taking a big step towards a more sustainable future. Let's do this!",
              style: GoogleFonts.notoSansMono(
                  color: widgitcolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ]),
      )),
    );
  }
}
