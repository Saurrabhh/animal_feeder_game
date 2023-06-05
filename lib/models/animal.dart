import 'package:animal_feeder_game/constants/assets.dart';

class Animal{
  int exp = 0;
  int level = 1;
  late List<String> imageUrl;
  final int _totalExp = 100;
  late int _maxLevel;

  void addExp(int value){
    exp += value;
    if(exp >= _totalExp){
      if(level != _maxLevel){
        level += 1;
        exp = exp - _totalExp;
      }
      else{
        exp = _totalExp;
      }
    }
  }

  String getImage(){
    return imageUrl[level-1];
  }

  String getAgeName(){
    return "";
}

}


class Tiger extends Animal {
  Tiger(){
    imageUrl = [MyAssets.tigerBaby,MyAssets.tigerKid,MyAssets.tigerTeen];
    _maxLevel = 3;
  }

  String getAgeName(){
    switch (level){
      case 1:
        return "Baby";
      case 2:
        return "Kid";
      case 3:
        return "Teen";
    }
    return "";
  }
}

class Elephant extends Animal {
  Elephant(){
    imageUrl = [MyAssets.elephantBaby,MyAssets.elephantTeen,MyAssets.elephantAdult];
    _maxLevel = 3;
  }

  String getAgeName(){
    switch (level){
      case 1:
        return "Baby";
      case 2:
        return "Teen";
      case 3:
        return "Adult";
    }
    return "";
  }
}