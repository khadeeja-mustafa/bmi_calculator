import 'package:bmi_calculator/core/colors_maneger.dart';
import 'package:bmi_calculator/core/style_maneger.dart';
import 'package:bmi_calculator/features/hight_cubit/hight_logic.dart';
import 'package:bmi_calculator/features/hight_cubit/hight_states.dart';
import 'package:bmi_calculator/features/screen_two/widgets/AgeWight_cubit.dart/AgeWight_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/age_wight.dart';
import 'widgets/AgeWight_cubit.dart/AgeWight_states.dart';

class ScreenTwo extends StatefulWidget {
  final String selectedGender;

  const ScreenTwo({super.key, required this.selectedGender});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AgeWeightLogec()),
        BlocProvider(create: (context) => HightLogic()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AgeWeightLogec, AgewightStates>(
          builder: (context, ageWeightState) {
            return BlocBuilder<HightLogic, HightStates>(
              builder: (context, heightState) {
                double currentAge = 20.0;
                double currentWeight = 50.0;
                double currentHeight = 100.0;

                if (ageWeightState is AgeWeightUpdated) {
                  currentAge = ageWeightState.age;
                  currentWeight = ageWeightState.weight;
                }

                if (heightState is HightUpdated) {
                  currentHeight = heightState.height;
                }

                double bmi = currentWeight / ((currentHeight / 100) * (currentHeight / 100));
                String category = getBMICategory(bmi);
                String bmiValue = bmi.toStringAsFixed(1);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.black, size: 25),
                        SizedBox(width: 10),
                        Text('BMI Calculator', style: StyleManeger.textStyle32O),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Please Modify the values', style: StyleManeger.textStyle24B),
                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: AgeWight(title: 'Age', isWeight: false),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: AgeWight(title: 'Weight', isWeight: true),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 236, 223),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text('Height', style: StyleManeger.textStyle18Gray),
                          Text(
                            currentHeight.toInt().toString(),
                            style: StyleManeger.textStyle48O,
                          ),
                          SizedBox(height: 10),
                          Slider(
                            value: currentHeight,
                            min: 100,
                            max: 220,
                            divisions: 120,
                            onChanged: (double newValue) {
                           context.read<HightLogic>().changeHeight(newValue);
                            },
                            activeColor: ColorsManeger.textColor2o,
                            inactiveColor: Colors.grey[300],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: ColorsManeger.malecontinarColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            title: Text('Your BMI:', style: StyleManeger.textStyle24B),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(bmiValue, style: StyleManeger.textStyle48O),
                                SizedBox(height: 10),
                                Text(category, style: StyleManeger.textStyle24B),
                                Divider(thickness: 1, height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Gender', style: StyleManeger.textStyle18G),
                                        SizedBox(height: 4),
                                        Text(widget.selectedGender),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Height', style: StyleManeger.textStyle18G),
                                        SizedBox(height: 4),
                                        Text('${currentHeight.toInt()} cm'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Weight', style: StyleManeger.textStyle18G),
                                        SizedBox(height: 4),
                                        Text('${currentWeight.toInt()} kg'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Age', style: StyleManeger.textStyle18G),
                                        SizedBox(height: 4),
                                        Text('${currentAge.toInt()} years'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Close', style: StyleManeger.textStyle32G),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManeger.buttonColor,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Calculate', style: StyleManeger.textStyle32W),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
