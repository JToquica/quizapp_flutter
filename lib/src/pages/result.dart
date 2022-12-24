import 'package:flutter/material.dart';
import 'package:quizapp/src/helpers/const.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswers, wrongAnswers;

  const ResultPage(
      {super.key, required this.correctAnswers, required this.wrongAnswers});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Resultados",
          style: TextStyle(color: backgroundColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: backgroundColor),
        backgroundColor: foregroundColor,
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnswerTab(
                  titulo: "Respuestas Correctas",
                  valor: correctAnswers,
                ),
                AnswerTab(
                  titulo: "Respuestas Incorrectas",
                  valor: wrongAnswers,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerTab extends StatelessWidget {
  final String titulo;
  final int valor;

  const AnswerTab({
    Key? key,
    required this.titulo,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          valor.toString(),
          style: const TextStyle(
            color: foregroundColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
