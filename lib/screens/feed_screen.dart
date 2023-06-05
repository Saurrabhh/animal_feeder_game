import 'package:animal_feeder_game/screens/click_meal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/animal_service.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalService = Provider.of<AnimalService>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                animalService.getCurrentAnimal().getImage(),
              ),
            ),
          ),
          const ClickMeal()
        ],
      ),
    );
  }
}
