
import 'package:flutter/material.dart';

Widget listCard(
    {required double height,
      required double width,
      required String image,
      required String text,
      required Color color}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.23,
      width: width * 0.33,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(image),
            ),
            const SizedBox(height: 10),
            const Expanded(
                flex: 1,
                child: Text(
                  "Fruits",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    ),
  );
}