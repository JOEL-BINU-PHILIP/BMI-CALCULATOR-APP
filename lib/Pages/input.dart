import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/Icon_Content.dart';
import '../Components/ReusableCard.dart';
import '../Components/konstants.dart';
import 'result.dart';
import '../Components/BottomBarNavigationButton.dart';
import 'calculatorBrain.dart';

enum Gender {
  Male,
  Female,
}



class InputPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int age = 40;
  int weight = 60;
  Color maleCardColour = kinactiveCardColour;
  Color femaleCardColour = kinactiveCardColour;
  void updateColour(Gender gender) {
    gender == Gender.Male
        ? maleCardColour = kactiveCardColour
        : maleCardColour = kinactiveCardColour;
    gender == Gender.Female
        ? femaleCardColour = kactiveCardColour
        : femaleCardColour = kinactiveCardColour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  //Here we are creating an anonymous function
                  onPressed: () {
                    setState(() {
                      updateColour(Gender.Male);
                    });
                  },
                  colour: maleCardColour,
                  cardChild: const IconWidget(
                    gender: 'MALE',
                    genderIcon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                onPressed: () {
                  setState(() {
                    updateColour(Gender.Female);
                  });
                },
                colour: femaleCardColour,
                cardChild: const IconWidget(
                  gender: 'FEMALE',
                  genderIcon: FontAwesomeIcons.venus,
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 180,
                  width: double.infinity,
                  margin: const EdgeInsetsDirectional.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFF1D1F33),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberStyle,
                          ),
                          const Text(
                            'cm',
                            style: klabelTextStyle,
                          )
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kinactiveCardColour,
                  onPressed: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundActionButton(
                              symbolicon: FontAwesomeIcons.plus,
                              assignment: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          const SizedBox(width: 10),
                          RoundActionButton(
                            symbolicon: FontAwesomeIcons.minus,
                            assignment: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kinactiveCardColour,
                  onPressed: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: klabelTextStyle,
                      ),
                      Text(age.toString(), style: kNumberStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundActionButton(
                              symbolicon: FontAwesomeIcons.plus,
                              assignment: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          const SizedBox(width: 10),
                          RoundActionButton(
                            symbolicon: FontAwesomeIcons.minus,
                            assignment: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIResult(
                       bmivalue: cal.calculateBMI(),
                      bmiInteerpretation: cal.getInterpretation(),
                      bmiResult: cal.getResult(),
                    ),
                  ),
                );
              },
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
              child: const BottomBarNavigationButton(
                barDAta: 'CALCULATE',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {
  final IconData symbolicon;
  final Function() assignment;
  const RoundActionButton({required this.symbolicon, required this.assignment});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: assignment,
      elevation: 0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints(minHeight: 56, minWidth: 56),
      child: Icon(
        symbolicon,
        color: Colors.white,
      ),
    );
  }
}
