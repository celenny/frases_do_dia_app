import 'package:flutter/material.dart';

import 'package:frases_do_dia/src/presentation/controller/quote_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _fraseGerada = "Clique abaixo para gerar uma frase!";
  var labelButton = "Nova Frase";
  var controller = QuoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Color(0xff6667AB),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/logo.png",
                height: 240,
                width: 240,
                fit: BoxFit.cover,
              ),
              RxBuilder(
                  builder: (_) => Text(controller.result,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 61, 56, 56),
                      ))),
              ElevatedButton(
                child: RxBuilder(
                    builder: (_) => Text(!controller.result.isEmpty
                        ? labelButton
                        : "Pesquisando uma frase para vc!")),
                onPressed: controller.find,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6667AB),
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
