
import 'dart:convert';

Nutrition nutritionFromJson(String str) => Nutrition.fromJson(json.decode(str));
String nutritionToJson(Nutrition data) => json.encode(data.toJson());

List<Nutrition> productsFromJson(String str) => List<Nutrition>.from(json.decode(str).map((x) => Nutrition.fromJson(x)));
String productsToJson(List<Nutrition> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Nutrition{
  String? name;
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

  Nutrition({
    this.name,
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

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
    name: json["name"],
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





