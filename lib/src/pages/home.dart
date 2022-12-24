import 'package:flutter/material.dart';
import 'package:quizapp/src/helpers/const.dart';
import 'package:quizapp/src/pages/question.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(color: backgroundColor),
        ),
        centerTitle: true,
        backgroundColor: foregroundColor,
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Quiz App",
              style: TextStyle(
                color: foregroundColor,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: foregroundColor,
              ),
              child: const Text(
                "Empezar",
                style: TextStyle(color: backgroundColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
