
abstract class AgewightStates {}

class AgewightInitial extends AgewightStates {}

class AgeWeightUpdated extends AgewightStates {
  final double age;
  final double weight;

  AgeWeightUpdated({required this.age, required this.weight, });
  
}