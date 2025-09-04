import 'package:bmi_calculator/features/screen_two/widgets/AgeWight_cubit.dart/AgeWight_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeWeightLogec extends Cubit<AgewightStates> {
  double age = 20;
  double weight = 50;

  AgeWeightLogec() : super(AgewightInitial());

  void incrementAge() {
    age++;
    emit(AgeWeightUpdated(age: age, weight: weight));
  }

  void decrementAge() {
    if (age > 1) {
      age--;
      emit(AgeWeightUpdated(age: age, weight: weight));
    }
  }

  void incrementWeight() {
    weight++;
    emit(AgeWeightUpdated(age: age, weight: weight));
  }

  void decrementWeight() {
    if (weight > 1.0) {
      weight--;
      emit(AgeWeightUpdated(age: age, weight: weight,));
    }
  }
  
}