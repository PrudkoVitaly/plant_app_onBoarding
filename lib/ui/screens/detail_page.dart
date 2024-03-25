import 'package:flutter/material.dart';
import 'package:plant_app_onboarding/constants.dart';
import 'package:plant_app_onboarding/model/plants.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;

    // Toggle favorite button
    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    // Toggle and remove from cart
    bool toggleIsSelected(bool isSelected) {
      return !isSelected;
    }

    return Scaffold(
      body: Stack(
        children: [
          // Top Icons
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(Icons.close,
                        color: Constants.primaryColor),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            bool isFavorited = toggleIsFavorite(
                                _plantList[widget.plantId]
                                    .isFavorated);
                            _plantList[widget.plantId].isFavorated =
                                isFavorited;
                          },
                        );
                      },
                      icon: Icon(
                        _plantList[widget.plantId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Plant Id
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              height: size.height * .8,
              width: size.width * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Image.asset(
                      height: 350,
                      _plantList[widget.plantId].imageURL,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 40,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                            title: 'Size',
                            plantFeature:
                                _plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'Humidity',
                            plantFeature: _plantList[widget.plantId]
                                .humidity
                                .toString(),
                          ),
                          PlantFeature(
                            title: 'Temperature',
                            plantFeature: _plantList[widget.plantId]
                                .temperature,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * .5,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, right: 20),
                    // Name and Rating
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              _plantList[widget.plantId].plantName,
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              r'$' +
                                  _plantList[widget.plantId]
                                      .price
                                      .toString(),
                              style: TextStyle(
                                color: Constants.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              _plantList[widget.plantId]
                                  .rating
                                  .toString(),
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 30,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Constants.primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    child: Expanded(
                      child: Text(
                        _plantList[widget.plantId].decription,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Constants.blackColor.withOpacity(.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: _plantList[widget.plantId].isSelected == true
                    ? Constants.primaryColor.withOpacity(.5)
                    : Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Constants.primaryColor.withOpacity(.3),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    bool isSelected = toggleIsSelected(
                        _plantList[widget.plantId].isSelected);
                    _plantList[widget.plantId].isSelected =
                        isSelected;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: _plantList[widget.plantId].isSelected == true
                      ? Colors.white
                      : Constants.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'BY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
