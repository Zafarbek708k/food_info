import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/model_for_delete_item.dart';
import '../service/http_client_service.dart';
class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  bool isLoading = false;
  List <NutritionDeletedModel> list =[];

  Future<String?> getData() async {
    String? result = await HttpClientService.getData2(
        api: HttpClientService.baseApiPost);
    if (result != null) {
      list = await deleteFromJson(result);
      isLoading = true;
      setState(() {

      });
      return result;
    } else {
      log("Error");
      log(result.toString());
    }
  }

  Future<String?>deleteData({required String id})async{
    String? result = await HttpClientService.deleteData(api: HttpClientService.baseApiPost, id: id);
    if(result != null){
      log(result.toString());
      log("Succesfully deleted");
      setState(() {
        getData();
      });
    }else{
      log("error delete function");
      log(result.toString());
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading ? ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            NutritionDeletedModel nutrition = list[index];
            return Slidable(
              endActionPane:
              ActionPane(motion: const ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (_)async {
                    log("bosildii");
                    String? info = await deleteData(id: nutrition.id!);
                    log(info.toString());
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  autoClose: true,
                  label: 'Delete',
                  borderRadius: BorderRadius.circular(20),
                ),
              ]),
              child: Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNutritionInfoRow("Name ", nutrition.name),
                      _buildNutritionInfoRow("Calories  k/kal", nutrition.calories),
                      _buildNutritionInfoRow("Sodium  ", nutrition.sodiumMg),
                      _buildNutritionInfoRow("Potassium ", nutrition.potassiumMg),
                      _buildNutritionInfoRow("CholesterolMg  ", nutrition.cholesterolMg),
                      _buildNutritionInfoRow("Serving Size  ", nutrition.servingSizeG),
                      _buildNutritionInfoRow("Protein  ", nutrition.proteinG),
                      _buildNutritionInfoRow("Sugar ", nutrition.sugarG),
                      _buildNutritionInfoRow("CarbohydratesTotalG  ", nutrition.carbohydratesTotalG),
                      _buildNutritionInfoRow("Fat Total G  ", nutrition.fatTotalG),
                      _buildNutritionInfoRow("Fiber G  ", nutrition.fiberG),
                      _buildNutritionInfoRow("Saturated Fat  ", nutrition.fatSaturatedG),
                    ],
                  ),
                ),
              ),
            );
          }): const CircularProgressIndicator(),
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



