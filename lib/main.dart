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
                Container(
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
                          decoration: InputDecoration(
                            labelText: "Peso (kg)",
                            hintText: "digite seu peso sem caracteres",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.balance),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Altura",
                            hintText: "digite sua altura sem caracteres",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.height),
                          ),
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
                            onPressed: () {},
                            child: Text("Enviar"),
                          ),
                        ),
                      ),
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
