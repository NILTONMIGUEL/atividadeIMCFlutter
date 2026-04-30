import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //declarando as variaveis de cores
  int colorBg = 0xFFD0211;
  Color colorTitulo = Colors.cyanAccent;
  int boxDecoration = 0xFF1A1A2E;
  Color borderBoxDecoration = Colors.purpleAccent;
  int color1 = 0xffb02ff;
  int color2 = 0xFF00E5FF;
  Color buttonColor = Colors.blueAccent;
  Color imcColor = const Color.fromARGB(0, 0, 0, 0);

  //criando o sistema para calcular

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  String resultado = "";
  String imcPeso = "";
  double imc = 0;
  bool mostrarDados = false;
  double _largura = 0.0;

  void calcularIMC() {
    if (_formkey.currentState!.validate()) {
      double altura = double.parse(_alturaController.text);
      double peso = double.parse(_pesoController.text);
      if (peso == 0 || altura == 0) {
        resultado = "digite a altura e peso valido";
        mostrarDados = false;
      } else {
        if (altura > 0 && altura <= 280 && peso > 0) {
          altura = altura / 100;
          imc = peso / (altura * altura);

          if (imc > 0 && imc <= 18.50) {
            mostrarDados = true;
            imcPeso = "Magreza";
            imcColor = Colors.deepOrangeAccent;
            resultado = "${imc.toStringAsFixed(2)}";
            // _largura = 300;
          } else if (imc > 18.50 && imc <= 24.90) {
            mostrarDados = true;
            imcPeso = "Normal";
            imcColor = Colors.green;
            // _largura = 300;
            resultado = "${imc.toStringAsFixed(2)}";
          } else if (imc > 24.90 && imc <= 29.90) {
            mostrarDados = true;
            imcPeso = "SobrePeso";
            imcColor = Colors.yellow;
            // _largura = 300;
            resultado = "${imc.toStringAsFixed(2)}";
          } else if (imc > 29.90 && imc <= 34.90) {
            // _largura = 300;
            mostrarDados = true;
            imcPeso = "Obesidade Grau 1";
            imcColor = const Color.fromARGB(255, 255, 98, 50);
            resultado = "${imc.toStringAsFixed(2)}";
          } else if (imc > 34.90 && imc <= 39.90) {
            // _largura = 300;
            mostrarDados = true;
            imcPeso = "Obesidade Grau 2 ";
            imcColor = const Color.fromARGB(255, 235, 2, 91);
            resultado = "${imc.toStringAsFixed(2)}";
          } else if (imc > 39.90) {
            // _largura = 300;
            mostrarDados = true;
            imcPeso = "Obesidade Grau 3 ";
            imcColor = const Color.fromARGB(255, 226, 16, 1);
            resultado = "${imc.toStringAsFixed(2)}";
          } else {
            mostrarDados = false;
            resultado = "";
          }
        }
      }

      setState(() {
        resultado;

        _largura = 0;
      });
      Future.delayed(Duration(milliseconds: 800), () {
        setState(() {
          _largura = 300;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //colocando um tema dark para a aplicação com um azul escuro
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(colorBg)),
      home: Scaffold(
        body: SingleChildScrollView(
          //permite rolar a tela caso o teclado abra
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CALCULO DE IMC",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    //efeitos de neon no texto
                    shadows: [Shadow(blurRadius: 15, color: colorTitulo)],
                  ),
                ),
                //dando um espaçamento para a minha primeira box
                const SizedBox(height: 50),

                //criando os cards inputs
                Form(
                  key: _formkey,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(boxDecoration),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: borderBoxDecoration, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: borderBoxDecoration,
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: TextFormField(
                            controller: _pesoController,
                            decoration: InputDecoration(
                              labelText: "Peso (kg)",
                              hintText: "digite seu peso sem caracteres",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: Icon(Icons.balance),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Preencher o campo Peso";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: TextFormField(
                            controller: _alturaController,
                            decoration: InputDecoration(
                              labelText: "Altura",
                              hintText: "digite sua altura sem caracteres",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: Icon(Icons.height),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Preencher o campo Altura";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(color1), Color(color2)],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: buttonColor,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(colorBg),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () {
                                calcularIMC();
                              },
                              child: Text("CALCULAR IMC"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: resultado.isEmpty
                            ? SizedBox()
                            : Container(
                                child: Center(
                                  child: Text(
                                    mostrarDados
                                        ? "seu imc é : $resultado"
                                        : "$resultado",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color: Colors.deepOrange,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Container(
                        child: Text(
                          mostrarDados ? imcPeso : "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            shadows: [
                              Shadow(blurRadius: 15, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                      mostrarDados
                          ? Container(
                              child: AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 500,
                                ), // Tempo da animação
                                curve: Curves.easeInOut,
                                width: _largura,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: mostrarDados
                                      ? imcColor
                                      : const Color.fromARGB(0, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
