import 'package:bmi_calc_2/Components/BottomBarNavigationButton.dart';
import 'package:flutter/material.dart';
import '../Components/konstants.dart';
import '../Components/ReusableCard.dart';

class BMIResult extends StatelessWidget {
  const BMIResult({super.key ,required this.bmivalue ,required this.bmiInteerpretation ,required this.bmiResult});
  final String bmiResult;
  final String bmiInteerpretation;
  final String bmivalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0D22),
        title: const Row(children: [
          SizedBox(
            width: 50,
          ),
          Text('BMI CALCULATOR')
        ]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20,left: 80) ,
              child: const Text(
                'Your Result',
                style: kResultAppBArStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPressed: () {},
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: KResultTextStyle,
                  ),
                  Text(
                    bmivalue,
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmiInteerpretation,
                    style: kBMISuggestion,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                  child: const BottomBarNavigationButton(
                    barDAta: 'RE-CALCULATE',
                  ),),)
        ],
      ),
    );
  }
}
