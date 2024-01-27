import 'package:flutter/material.dart';
import 'Pages/input.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
        appBarTheme: const AppBarTheme(color: Color(0xFF0A0D22),),
        sliderTheme:  const SliderThemeData(thumbColor: Color(0xFFEB1455), thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15,disabledThumbRadius: 10),activeTrackColor: Colors.white,overlayColor: Color(0x29EB1455),inactiveTrackColor:Color(0xFF8D8E98)),
      ),
      home: InputPage(),
    );
  }
}
