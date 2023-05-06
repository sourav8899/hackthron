import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Mycol extends StatelessWidget {
  final String text;
  final iconimage;
  final String cat;
  Mycol({required this.text, required this.iconimage, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(cat,
              style: GoogleFonts.notoSansMono(
                  textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.greenAccent[700],
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 2.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 197, 229, 204),
                  ),
                ],
              ))),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              iconimage,
              height: 250,
              width: 390,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(text,
                textAlign: TextAlign.justify,
                style: GoogleFonts.notoSansMono(
                    textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.greenAccent[700],
                ))),
          ),
        ],
      ),
    );
  }
}
