import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack/variables.dart';

class intropage2 extends StatelessWidget {
  const intropage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Center(
        child: Column(children: [
          Image.asset(
            "assets/images/18.png",
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              child: Text(
                "Waste identification made easy:",
                style: GoogleFonts.notoSansMono(
                  color: widgitcolor,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,
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
              "you can say goodbye to the days of wondering what kind of waste you have. Just snap a picture of it and our app will identify it for you in a snap! We can identify everything from paper and plastic to glass and metal.",
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
