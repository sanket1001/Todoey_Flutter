import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/card_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calcualator_brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int usrHeight = 180;
  int usrWeight = 60;
  int usrAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    col: selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: cardContent(
                      iconForCard: kLeftCardIcon,
                      textForCard: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    col: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: cardContent(
                      iconForCard: kRightCardIcon,
                      textForCard: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              col: kInactiveCardColor,
              cardChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
//                  SizedBox(
//                    height: 10.0,
//                  ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          usrHeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kSliderInactiveColor,
                        activeTrackColor: kSliderActiveColor,
                        thumbColor: kThumbColor,
                        overlayColor: kOverlayColor,
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      ),
                      child: Slider(
                        min: kMinHeight,
                        max: kMaxHeight,
                        value: usrHeight.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            usrHeight = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    col: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          usrWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (usrWeight > 0) usrWeight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    usrWeight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    col: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          usrAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (usrAge > 0) usrAge--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    usrAge++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTxt: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: usrHeight, weight: usrWeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
