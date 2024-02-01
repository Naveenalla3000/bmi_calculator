import 'package:bmi_calculater/bmi_calculater_material_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const BmiCalculatorMaterialPage(),
    );
  }
}
