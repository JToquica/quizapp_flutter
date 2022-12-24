import 'package:flutter/material.dart';
import 'package:quizapp/src/helpers/const.dart';
import 'package:quizapp/src/helpers/questions.dart';
import 'package:quizapp/src/models/question.dart';
import 'package:quizapp/src/pages/result.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final PageController pageController = PageController();
  bool isAnswerLocked = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = "", selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: backgroundColor),
        title: const Text(
          "Quiz",
          style: TextStyle(color: backgroundColor),
        ),
        centerTitle: true,
        backgroundColor: foregroundColor,
      ),
      body: SizedBox(
        width: size.width,
        child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: preguntas.length,
          itemBuilder: (context, index) {
            Question pregunta = preguntas[index];
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    pregunta.pregunta,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(color: foregroundColor),
                  Column(
                    children: List.generate(
                      pregunta.respuestas.length,
                      (index) => InkWell(
                        onTap: () {
                          setState(() {
                            isAnswerLocked = true;
                            selectedAnswer = pregunta.respuestas[index];
                            correctAnswer = pregunta.respuestaCorrecta;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.centerLeft,
                          width: size.width * 0.88,
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                            border: Border.all(color: foregroundColor),
                            borderRadius: BorderRadius.circular(10),
                            color: selectedAnswer == pregunta.respuestas[index]
                                ? foregroundColor
                                : backgroundColor,
                          ),
                          child: Text(
                            pregunta.respuestas[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (isAnswerLocked) {
            if (selectedAnswer == correctAnswer) {
              correctAnswers++;
            } else {
              wrongAnswers++;
            }
            currentIndex++;
            if (currentIndex != preguntas.length) {
              pageController.jumpToPage(currentIndex);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    correctAnswers: correctAnswers,
                    wrongAnswers: wrongAnswers,
                  ),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Debe seleccionar una respuesta"),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Container(
          color: foregroundColor,
          height: size.height * 0.08,
          alignment: Alignment.center,
          child: const Text(
            "Siguiente",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
