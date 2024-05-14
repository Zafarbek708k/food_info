

import 'dart:convert';

List<NutritionDeletedModel> deleteFromJson(String str) => List<NutritionDeletedModel>.from(json.decode(str).map((x) => NutritionDeletedModel.fromJson(x)));
class NutritionDeletedModel{
  String? name;
  String? id;
  double? calories;
  double? servingSizeG;
  double? fatTotalG;
  double? fatSaturatedG;
  double? proteinG;
  int? sodiumMg;
  int? potassiumMg;
  int? cholesterolMg;
  double? carbohydratesTotalG;
  double? fiberG;
  double? sugarG;

  NutritionDeletedModel({
    this.name,
    this.id,
    this.calories,
    this.servingSizeG,
    this.fatTotalG,
    this.fatSaturatedG,
    this.proteinG,
    this.sodiumMg,
    this.potassiumMg,
    this.cholesterolMg,
    this.carbohydratesTotalG,
    this.fiberG,
    this.sugarG,
  });

  factory NutritionDeletedModel.fromJson(Map<String, dynamic> json) => NutritionDeletedModel(
    name: json["name"],
    id: json["id"],
    calories: json["calories"].toDouble(),
    servingSizeG: json["serving_size_g"].toDouble(),
    fatTotalG: json["fat_total_g"].toDouble(),
    fatSaturatedG: json["fat_saturated_g"].toDouble(),
    proteinG: json["protein_g"].toDouble(),
    sodiumMg: json["sodium_mg"],
    potassiumMg: json["potassium_mg"],
    cholesterolMg: json["cholesterol_mg"],
    carbohydratesTotalG: json["carbohydrates_total_g"].toDouble(),
    fiberG: json["fiber_g"].toDouble(),
    sugarG: json["sugar_g"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "calories": calories,
    "serving_size_g": servingSizeG,
    "fat_total_g": fatTotalG,
    "fat_saturated_g": fatSaturatedG,
    "protein_g": proteinG,
    "sodium_mg": sodiumMg,
    "potassium_mg": potassiumMg,
    "cholesterol_mg": cholesterolMg,
    "carbohydrates_total_g": carbohydratesTotalG,
    "fiber_g": fiberG,
    "sugar_g": sugarG,
  };
}