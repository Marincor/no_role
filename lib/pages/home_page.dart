import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:no_role/main.dart';
import 'package:no_role/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30.0),
              child: Image.network(
                  "https://images.nappy.co/uploads/large/high-res-0325-21592075363xkaufglncvaxh69vd9ouyxi4pr9votdqqrea5wtakcfqxaugjvdveh7oaaz0cwecvycbbs14l45zzpmbq3tfezqqgstlspmyyu7a.jpg?auto=format&fm=jpg&w=1280&q=75",
                  color: Color.fromRGBO(98, 6, 35, 0.2),
                  colorBlendMode: BlendMode.colorBurn,
                  width: MediaQuery.of(context).size.width),
            ),
            Text("Qual é o seu rolê?",
                style: GoogleFonts.roboto(fontSize: 30.0)),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () {},
                      child: Icon(
                        Icons.place,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Text(
                    "Margue os lugares que quer conhecer",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
