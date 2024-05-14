import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_info/pages/menu.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Menu()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(145, 199, 136, 1),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const Text(
              "kcal",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                fontFamily: "Nunito"
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),

            Text(
              " ZUAMICA",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Nunito"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
