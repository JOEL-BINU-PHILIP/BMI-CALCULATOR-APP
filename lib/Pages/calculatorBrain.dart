import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });
  final int weight;
  final int height;
   double? _bmi;
  double calculateBMI2() {
    return weight / pow(height / 100, 2);
  }
  String calculateBMI() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);      
  }
  String getResult() {
   if (_bmi! >= 25) {
     return 'OVERWEIGHT';
   }
   else if(_bmi!>= 18 && _bmi! < 25){
    return 'NORMAL';
   }
   else{
    return 'UNDER WEIGHT';
   }
  }

  String getInterpretation() {
   if (_bmi! >= 25) {
     return 'You are above the the normal weight. Try to execise more!';
   }
   else if(_bmi!>= 18 && _bmi! < 25){
    return 'You have a normal weight . Good Job!';
   }
   else{
    return 'You are under the normal weight . Try to eat little bit more !';
   }
  }
}
