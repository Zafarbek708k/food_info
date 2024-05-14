import 'package:flutter/material.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({super.key, required this.changeState});
  final Function(bool) changeState;

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, top: 50),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 25,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.cyan,
                  onPressed: () {
                    setState(() {
                      widget.changeState(false);
                    });
                  },
                  child: const Icon(Icons.keyboard_double_arrow_left),
                ),
                Spacer(),
                const Text(
                  "Empty",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                )
              ],
            ),

            Image.asset("assets/images/empty_basket.png"),

            const SizedBox(height: 10),

            const Text("Sorry you don't have any item")
          ],
        ),
      ),
    );
  }
}