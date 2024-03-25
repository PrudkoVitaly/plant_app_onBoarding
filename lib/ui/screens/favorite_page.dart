import 'package:flutter/material.dart';
import 'package:plant_app_onboarding/constants.dart';

import '../../model/plants.dart';
import 'widgets/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoritePage({super.key, required this.favoritedPlants});

  @override
  State<FavoritePage> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset("assets/images/favorited.png"),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your favorited Plants',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 30),
              height: size.height * .6,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.favoritedPlants.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return PlantWidget(
                    index: index,
                    plantList: widget.favoritedPlants,
                  );
                },
              ),
            ),
    );
  }
}
