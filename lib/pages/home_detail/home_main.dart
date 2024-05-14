import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/nutrition_model.dart';
import '../../service/http_client_service.dart';
import '../../widgets/favorites_list_card.dart';

class SimplePage extends StatefulWidget {
  final bool isGet;
  final List<Nutrition> list;
  final Function(List<Nutrition>) onDataReceived;

  const SimplePage({super.key, required this.isGet, required this.list, required this.onDataReceived});
  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  TextEditingController searchController = TextEditingController();
  late String paramValue;
  bool isPlay = true;

  Future<void> getData() async {
    String? result = await HttpClientService.getData(
      api: HttpClientService.baseApi,
      param: {"query": paramValue},
    );
    if (result != null) {
      List<Nutrition> list = productsFromJson(result);
      widget.onDataReceived(list);

      for (int i = 0; i < list.length; i++) {
        postData(data: list[i].toJson());
      }
    } else {
      log("Error");
    }
  }


  Future<String?> postData({required Map<String, dynamic> data}) async {
    String? result = await HttpClientService.postData(
        api: HttpClientService.baseApiPost, data: data);
    if (result != null) {
      log(result.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: SizedBox(
        height: height,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello Shambhavi,",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(145, 199, 136, 1),
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Find, track and eat heathy food.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(123, 123, 123, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              SizedBox(height: height * 0.05),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  onSubmitted: (value) async {
                    paramValue = value;
                    await getData();
                    searchController.clear();
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Junk Food",
                  ),
                ),
              ),


              SizedBox(height: height * 0.03),

              /// Container  purple
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: width,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(158, 155, 199, 1),
                      borderRadius: BorderRadius.circular(24)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Track Your\n Weekly Progress",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isPlay = !isPlay;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "View Now",
                                    style: TextStyle(
                                        color: Colors.deepPurple.withOpacity(1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  isPlay
                                      ? const Icon(Icons.play_arrow_rounded)
                                      : const Icon(Icons.pause),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.04),

              /// Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Choose Your Favorites",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ),

              SizedBox(height: height * 0.05),

              /// ListView
              SizedBox(
                height: height * 0.2 + 25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    listCard(
                        height: height,
                        width: width,
                        image: "assets/images/strawBerry.png",
                        text: "Fruit",
                        color: Colors.cyan),
                    listCard(
                        height: height,
                        width: width,
                        image: "assets/images/vegetable.png",
                        text: "Vegetables",
                        color: Colors.deepOrangeAccent),
                    listCard(
                      height: height,
                      width: width,
                      image: "assets/images/snack.png",
                      text: "Snacks",
                      color: Colors.yellow.withOpacity(0.7),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
