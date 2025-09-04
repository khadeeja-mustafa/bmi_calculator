import 'package:bmi_calculator/features/screenone/widgets/gender_cubit/gender_logic.dart';
import 'package:bmi_calculator/features/screenone/widgets/gender_cubit/gender_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors_maneger.dart' show ColorsManeger;
import '../../core/style_maneger.dart';
import 'widgets/gender.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI Calculator', style: StyleManeger.textStyle32G),
            SizedBox(height: 20),
            Text('Please choose your gender', style: StyleManeger.textStyle24B),
            SizedBox(height: 20),

            BlocBuilder<GenderLogic, GenderState>(
              builder: (context, state) {
                String? selectedGender;
                if (state is GenderChanged) {
                  selectedGender = state.selectedGender;
                }

                return Column(
                  children: [
                    GenderSelection(
                      gender: 'Female',
                      style: StyleManeger.textStyle32O,
                      isSelected: selectedGender == 'Female',
                      onTap: () {
                        context.read<GenderLogic>().selectGender('Female');
                      },
                      imagepath: 'assets/images/female.png',
                    ),
                    SizedBox(height: 10),
                    GenderSelection(
                      gender: 'Male',
                      style: StyleManeger.textStyle32G,
                      isSelected: selectedGender == 'Male',
                      onTap: () {
                        context.read<GenderLogic>().selectGender('Male');
                      },
                      imagepath: 'assets/images/male.png',
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                      if (selectedGender == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select a gender.')),
                          );
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          '/screenTwo',
                          arguments: selectedGender,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManeger.buttonColor,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text('Continue', style: StyleManeger.textStyle32W),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
