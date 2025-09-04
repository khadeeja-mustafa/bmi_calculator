
abstract class GenderState {}

class GenderInitial extends GenderState {}

class GenderChanged extends GenderState {
  final String selectedGender;
  GenderChanged(this.selectedGender);
  
}
