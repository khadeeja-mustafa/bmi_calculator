import 'package:bmi_calculator/features/hight_cubit/hight_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HightLogic extends Cubit<HightStates> {
  double height = 100;

  HightLogic() : super(HightInitial());

  void incrementHeight() {
    height++;
    emit(HightUpdated(height: height)); 
  }

  void decrementHeight() {
    if (height > 100) { 
      height--;
      emit(HightUpdated(height: height));
    }
  }

  void changeHeight(double newValue) {
    height = newValue;
    emit(HightUpdated(height: height));
  }
  
}