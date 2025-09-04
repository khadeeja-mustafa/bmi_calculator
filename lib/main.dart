import 'package:bmi_calculator/features/screenone/widgets/gender_cubit/gender_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/screenone/screen_one.dart';
import 'features/screen_two/screen_two.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderLogic(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const ScreenOne(),
          '/screenTwo': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as String?;
            return ScreenTwo(selectedGender: args ?? 'Not specified');
          }}
      ),
    );
  }
}
