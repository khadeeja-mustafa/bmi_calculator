import 'package:bmi_calculator/core/style_maneger.dart';
import 'package:bmi_calculator/features/screen_two/widgets/AgeWight_cubit.dart/AgeWight_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_calculator/features/screen_two/widgets/AgeWight_cubit.dart/AgeWight_states.dart';

class AgeWight extends StatelessWidget {
  final String title;
  final bool isWeight; 
  const AgeWight({
    super.key,
    required this.title,
    required this.isWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 236, 223),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: StyleManeger.textStyle18Gray),
            const SizedBox(height: 8),
            
            BlocBuilder<AgeWeightLogec, AgewightStates>(
              builder: (context, state) {
                double value;

                if (state is AgeWeightUpdated) {
                  value = isWeight ? state.weight : state.age;
                } else {
                  value = isWeight ? 50.0 : 20.0;
                }

                return Text(
                  value.toInt().toString(),
                  style: StyleManeger.textStyle48O,
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final cubit = context.read<AgeWeightLogec>();
                    if (isWeight) {
                      cubit.incrementWeight(); // استخدم الـ Cubit
                    } else {
                      cubit.incrementAge();
                    }
                  },
                  child: const Icon(Icons.add, size: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    final cubit = context.read<AgeWeightLogec>();
                    if (isWeight) {
                      cubit.decrementWeight();
                    } else {
                      cubit.decrementAge();
                    }
                  },
                  child: const Icon(Icons.remove, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}