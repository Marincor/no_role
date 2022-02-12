import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: Column(children: [
        Text(
          "Encontre o rolê perfeito",
          style: GoogleFonts.roboto(
              fontSize: 30.0, color: Color.fromARGB(255, 90, 88, 88)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
          child: SizedBox(
            width: 380,
            child: TextField(
              style: TextStyle(fontSize: 20),
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                  labelText: "Lugar"),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: 380,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              onPressed: () {},
              child: Text(
                'Buscar',
                style: GoogleFonts.roboto(
                    fontSize: 24.0, fontWeight: FontWeight.w300),
              )),
        ),
      ]),
    );
  }
}
