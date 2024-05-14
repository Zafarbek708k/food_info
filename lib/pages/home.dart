import 'package:flutter/cupertino.dart';

import '../models/nutrition_model.dart';
import 'home_detail/empty_page.dart';
import 'home_detail/free_widget.dart';
import 'home_detail/home_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  bool isGetData = false;
  List<Nutrition> nutritionList = [];
  void changeState(bool newState) {
    setState(() {
      isGetData = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isGetData
        ? (nutritionList.isEmpty
        ? EmptyWidget(changeState: changeState)
        : FreeWidget(list: nutritionList, changeState: changeState))
        : SimplePage(
      isGet: isGetData,
      list: nutritionList,
      onDataReceived: (List<Nutrition> list) {
        setState(() {
          nutritionList = list;
          isGetData = true;
        });
      },
    );
  }
}
