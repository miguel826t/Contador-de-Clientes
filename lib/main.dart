import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fundo.png'), fit: BoxFit.cover),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            isFull ? 'Lotado!' : 'Pode entrar!',
            style: TextStyle(
              color: isFull ? Colors.red : Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  // Deslocamento da sombra
                  blurRadius: 3.0,
                  // Raio de desfoque da sombra
                  color: Colors.black.withOpacity(0.5), // Cor da sombra
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: isFull ? Colors.red : Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    offset: const Offset(2.0, 2.0),
                    // Deslocamento da sombra
                    blurRadius: 3.0,
                    // Raio de desfoque da sombra
                    color: Colors.black.withOpacity(0.5), // Cor da sombra
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: TextButton(
                      onPressed: isEmpty ? null : decrement,
                      child: Text(
                        '- \n Saiu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              // Deslocamento da sombra
                              blurRadius: 3.0,
                              // Raio de desfoque da sombra
                              color: Colors.black
                                  .withOpacity(0.5), // Cor da sombra
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: TextButton(
                      onPressed: isFull ? null : increment,
                      child: Text(
                        '+ \n Entrou',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: const Offset(2.0, 2.0),
                              // Deslocamento da sombra
                              blurRadius: 3.0,
                              // Raio de desfoque da sombra
                              color: Colors.black
                                  .withOpacity(0.5), // Cor da sombra
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
