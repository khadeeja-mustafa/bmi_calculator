
abstract class HightStates {}

class HightInitial extends HightStates {}

class HightUpdated extends HightStates {
  final double height;

  HightUpdated ({required this.height});
  
}