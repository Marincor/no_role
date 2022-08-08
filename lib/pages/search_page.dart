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

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  String _therm = "";
  bool _showKeyBoard = false;
  final _thermController = TextEditingController();
  static RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  String _imgUrl = "";
  late AnimationController spinner_controller;

  void get() async {
    http.Response response;
    if (_therm != "") {
      response = await http.get(Uri.parse(Requests(therm: _therm).getPhotos()),
          headers: headersPhotos);
    } else {
      response = await http.get(Uri.parse(Requests(therm: _therm).getPhotos()),
          headers: headersPhotos);
    }

    setState(() {
      _imgUrl = json.decode(response.body)[0]['image']['url'];
    });

    return json.decode(response.body);
  }

  void _toggleKeyBoard(bool show) {
    setState(() {
      _showKeyBoard = show;
    });
  }

  void _getPlace() async {
    Timer(Duration(seconds: 2), () {
      get();
      _btnController.success();
    });
  }

  @override
  void initState() {
    super.initState();
    spinner_controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
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
              readOnly: _showKeyBoard,
              showCursor: _showKeyBoard,
              controller: _thermController,
              onTap: () => _toggleKeyBoard(false),
              onChanged: (text) {
                setState(() {
                  _therm = text;
                });
              },
              style: TextStyle(fontSize: 20, color: Colors.black),
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
            onPressed: () =>
                {_toggleKeyBoard(true), _getPlace(), _thermController.clear()},
            child: Text(
              "Buscar",
              style: GoogleFonts.roboto(
                  fontSize: 28.0, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        _Card(context)
      ]),
    );
  }

  Widget _Card(BuildContext context) {
    if (_imgUrl != '') {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Expanded(
          child: Column(
            children: [
              Text(
                _therm.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: _imgUrl == ""
                    ? CircularProgressIndicator(color: Colors.black)
                    : Image.network(
                        _imgUrl,
                        width: 500.0,
                        height: 200.0,
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("clicado");
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(98, 6, 35, 1))),
                child: Text("Adicionar à lista"),
              )
            ],
          ),
        ),
      );
    } else {
      return (Container(
        child: CircularProgressIndicator(
          value: spinner_controller.value,
          semanticsLabel: 'Linear progress indicator',
        ),
      ));
    }
  }
}
