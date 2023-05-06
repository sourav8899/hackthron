import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Category_card extends StatelessWidget {
  final iconImage;
  final String categoryname;
  Category_card({required this.iconImage, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green[50],
        ),
        child: Column(children: [
          Image.asset(
            iconImage,
            height: 110,
          ),
          SizedBox(
            height: 20,
          ),
          Text(categoryname,
              style: GoogleFonts.notoSansMono(
                  textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.5),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 197, 229, 204),
                  ),
                ],
              ))),
        ]),
      ),
    );
  }
}
