import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  String peso = '';
  String altura = '';
  String resultadoIMC = '';

  void calcularIMC() {
    double? pesoDouble = double.tryParse(peso);
    double? alturaDouble = double.tryParse(altura);

    if (pesoDouble != null && alturaDouble != null && alturaDouble > 0) {
      double imc = pesoDouble / (alturaDouble * alturaDouble);
      String classificacao;

      if (imc < 18.5) {
        classificacao = 'Abaixo do peso';
      } else if (imc >= 18.5 && imc < 24.9) {
        classificacao = 'Peso normal';
      } else if (imc >= 25 && imc < 29.9) {
        classificacao = 'Sobrepeso';
      } else {
        classificacao = 'Obesidade';
      }

      setState(() {
        resultadoIMC = 'Seu IMC é ${imc.toStringAsFixed(2)}: $classificacao';
      });
    } else {
      setState(() {
        resultadoIMC = 'Peso ou altura inválidos!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC'),
        backgroundColor: const Color.fromARGB(255, 0, 170, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Peso',
              style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 170, 255)),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite seu peso',
              ),
              onChanged: (value) {
                setState(() {
                  peso = value;
                });
              },
              keyboardType: TextInputType.number,
            ),
            Text(
              'Altura',
              style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 170, 255)),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite sua altura',
              ),
              onChanged: (value) {
                setState(() {
                  altura = value;
                });
              },
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                calcularIMC();
              },
              child: Text('Avaliar'),
            ),
            SizedBox(height: 20),
            Text(
              resultadoIMC,
              style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 170, 255)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}