
import 'package:bmi_calculator/features/screenone/widgets/gender_cubit/gender_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderLogic extends Cubit<GenderState> {
  GenderLogic() : super(GenderInitial());

  void selectGender(String gender) {
    emit(GenderChanged(gender));
  }
}
