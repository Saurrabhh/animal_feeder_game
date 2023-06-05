import 'package:animal_feeder_game/models/animal.dart';
import 'package:flutter/foundation.dart';

class AnimalService extends ChangeNotifier {
  final List<Animal> _animals = [Tiger(), Elephant()];

  List<Animal> get animals => _animals;

  int _selectedAnimalIndex = 0;

  int get selectedAnimalIndex => _selectedAnimalIndex;

  void setAnimalIndex(int index) {
    _selectedAnimalIndex = index;
    notifyListeners();
  }

  Animal getCurrentAnimal() {
    return _animals[_selectedAnimalIndex];
  }


  void addExp(int value) {
    _animals[_selectedAnimalIndex].addExp(value);
    notifyListeners();
  }
}
