import 'package:flutter/material.dart';

import '../../../core/colors_maneger.dart';

class GenderSelection extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final Function() onTap;
  final String imagepath; 
  final TextStyle style;

  const GenderSelection({super.key,
  required this.gender,
  required this.isSelected,
  required this.onTap, 
  required this.imagepath, required this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
      onTap: () =>  onTap (),
      child: Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
      color: isSelected? ColorsManeger.pickColor3 : ColorsManeger.femalecontinarColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(0, 3),

      )]
      ),
      
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(gender, style: style,),
      
        Image.asset(
        imagepath,
        height: 150,
        width: 150,
        
  ),
  

        

      ],),
     
     ),
      ),
    );
  
  }
}