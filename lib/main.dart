import "dart:math";
import 'package:flutter/material.dart';


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
  var _frases = [
    "É em meio a dificuldade que se encontra a oportunidade.",
    "Se nada der certo hoje, acorde mais cedo amanhã e tente novamente.",
    "A primeira pessoa que tem que acreditar nos seus sonhos é você mesmo, não aguarde pelo incentivo dos outros",
    "Você é digno de tudo o que almeja e merecedor de tudo o que possui",
    "Quando você se acostuma a confiar em si mesmo, as coisas começam a dar certo",
    "Você tem a capacidade para dominar o mundo, com o seu esforço e sendo você mesmo",
    "Confie no seu potencial, encare os seus medos e faça da bravura o seu mantra diário",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

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
              Text(
                "$_fraseGerada",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 61, 56, 56),
                ),
              ),
              ElevatedButton(
                child: Text("Nova Frase "),
                onPressed: () {
                  setState(() {
                    _fraseGerada = _frases.elementAt(Random().nextInt(_frases.length));
                  });
                },
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