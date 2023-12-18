import 'package:flutter/material.dart';
import 'package:nomnom/src/models/food_model.dart';
import 'package:nomnom/src/screens/foods/components/food_item.dart';

class MostPopularSection extends StatefulWidget {
  const MostPopularSection({super.key});

  @override
  State<MostPopularSection> createState() => _MostPopularSectionState();
}

class _MostPopularSectionState extends State<MostPopularSection> {
  List<FoodModel> foods = [
    FoodModel(
      plateImageUrl: 'assets/foods/1.png',
      title: 'Garlic Aioli Chicken Wings + Glazed Yams',
      description: 'Savor the perfect blend of savory and sweet with Garlic Aioli Chicken Wings and Glazed Yams',
      price: 12.99,
      rate: 4.5,
    ),
    FoodModel(
      plateImageUrl: 'assets/foods/1.png',
      title: 'Garlic Aioli Chicken Wings + Glazed Yams',
      description: 'Savor the perfect blend of savory and sweet with Garlic Aioli Chicken Wings and Glazed Yams',
      price: 12.99,
      rate: 4.5,
    ),
    FoodModel(
      plateImageUrl: 'assets/foods/1.png',
      title: 'Garlic Aioli Chicken Wings + Glazed Yams',
      description: 'Savor the perfect blend of savory and sweet with Garlic Aioli Chicken Wings and Glazed Yams',
      price: 12.99,
      rate: 4.5,
    ),
  ];

  PageController? controller;

  int currentPage = 0;

  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
      viewportFraction: 0.6,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Most',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Popular Food',
                style: TextStyle(
                  color: Color(0xFF4F4D4E),
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _buildItems(context),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  _buildItems(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
          });
        },
        children: foods.map((food) {
          bool isSelected;
          isSelected = foods.indexOf(food) == currentPage;
          return Transform.translate(
            offset: Offset(-((MediaQuery.sizeOf(context).width / 2 - 50) / 2 - 16), 0),
            child: FoodItem(
              food: food,
              isSelected: isSelected,
            ),
          );
        }).toList(),
      ),
    );
  }
}
