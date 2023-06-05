import 'package:animal_feeder_game/services/animal_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class AnimalsGridView extends StatelessWidget {
  const AnimalsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalService = Provider.of<AnimalService>(context);
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: animalService.animals.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final animal = animalService.animals[index];
        return Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => animalService.setAnimalIndex(index),
                child: Stack(
                  children: [
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          animal.getImage(),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.circle,
                        color: index == animalService.selectedAnimalIndex
                            ? kPrimaryColor
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              animal.getAgeName(),
              style: GoogleFonts.andika(
                  textStyle: Theme.of(context).textTheme.titleMedium),
            )
          ],
        );
      },
    );
  }
}
