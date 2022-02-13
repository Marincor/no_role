import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:no_role/environment/env.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _therm = "";
  final _thermController = TextEditingController();
  static RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  String _imgUrl = "";

  void get() async {
    http.Response response;
    if (_therm! == "") {
      response = await http.get(Uri.parse(Requests(therm: _therm).getPhotos()),
          headers: headersPhotos);
    } else {
      response = await http.get(Uri.parse(Requests(therm: _therm).getPhotos()),
          headers: headersPhotos);
    }
    print(json.decode(response.body));
    print(json.decode(response.body)[0]['image']['url']);
    setState(() {
      _imgUrl = json.decode(response.body)[0]['image']['url'];
    });

    print('iamgem agora: $_imgUrl');
    return json.decode(response.body);
  }

  void _getPlace() async {
    Timer(Duration(seconds: 3), () {
      setState(() {
        get();
      });
      _btnController.success();
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
          padding: EdgeInsets.only(top: 50.0, bottom: 16.0),
          child: SizedBox(
            width: 380,
            child: TextField(
              controller: _thermController,
              onChanged: (text) {
                setState(() {
                  _therm = text;
                });
              },
              style: TextStyle(fontSize: 20),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                  labelText: "Lugar"),
            ),
          ),
        ),
        SizedBox(
          child: RoundedLoadingButton(
            borderRadius: 8,
            width: 380,
            color: Colors.black,
            successColor: Color.fromRGBO(98, 6, 35, 1),
            controller: _btnController,
            onPressed: _getPlace,
            child: Text(
              "Buscar",
              style: GoogleFonts.roboto(
                  fontSize: 28.0, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ]),
    );
  }
}
