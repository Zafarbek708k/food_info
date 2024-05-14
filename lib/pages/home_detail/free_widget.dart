import 'package:flutter/material.dart';
import '../../models/nutrition_model.dart';

class FreeWidget extends StatefulWidget {
  List<Nutrition> list;
  final Function(bool) changeState;
  FreeWidget({super.key, required this.list, required this.changeState});



  @override
  State<FreeWidget> createState() => _FreeWidgetState();
}

class _FreeWidgetState extends State<FreeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 50),
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
                  "All Nutrition",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  Nutrition nutrition = widget.list[index];
                  return Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNutritionInfoRow("Name", nutrition.name),
                          _buildNutritionInfoRow("Protein", nutrition.proteinG),
                          _buildNutritionInfoRow("Sugar", nutrition.sugarG),
                          _buildNutritionInfoRow("Sodium", nutrition.sodiumMg),
                          _buildNutritionInfoRow(
                              "Serving Size", nutrition.servingSizeG),
                          _buildNutritionInfoRow(
                              "Potassium", nutrition.potassiumMg),
                          _buildNutritionInfoRow(
                              "Saturated Fat", nutrition.fatSaturatedG),
                          _buildNutritionInfoRow(
                              "Calories", nutrition.calories),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildNutritionInfoRow(String label, dynamic value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Text(
          "$label: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value != null ? value.toString() : "N/A",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
