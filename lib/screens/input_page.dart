import 'package:check_your_bmi/components/bottom_button.dart';
import 'package:check_your_bmi/components/reusable_card.dart';
import 'package:check_your_bmi/components/round_icon_button.dart';
import 'package:check_your_bmi/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:check_your_bmi/components/constants.dart';
import 'package:check_your_bmi/components/icon_content.dart';
import 'package:check_your_bmi/bmi_calculation.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender = Gender.MALE;
  int height = 160;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.MALE;
                      });
                    },
                    color: selectGender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.FEMALE;
                      });
                    },
                    color: selectGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: kActiveCardColor,
            cardChild: slideInput(),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: buildWeight(),
                )),
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: buildAge(),
                )),
              ],
            ),
          ),
          BottomButton(
            text: "CALCULATE",
            onPressed: () {
              BMICalculator calc =
                  BMICalculator(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calc.calculateBMI(),
                    result: calc.getResult(),
                    response: calc.getInterpretation(),
                    color: calc.colorCheck(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildWeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "WEIGHT",
          style: kLabelTextStyle,
        ),
        Text(
          "$weight",
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            RoundIconButton(
              iconData: FontAwesomeIcons.plus,
              onPressed: () {
                if (!(weight > 124)) {
                  setState(() {
                    weight++;
                  });
                }
              },
            ),
            SizedBox(width: 10),
            RoundIconButton(
              iconData: FontAwesomeIcons.minus,
              onPressed: () {
                if (!(weight < 11)) {
                  setState(() {
                    weight--;
                  });
                }
              },
            ),
          ],
        )
      ],
    );
  }

  Widget buildAge() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "AGE",
          style: kLabelTextStyle,
        ),
        Text(
          "$age",
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            RoundIconButton(
              iconData: FontAwesomeIcons.plus,
              onPressed: () {
                if (!(age > 109)) {
                  setState(() {
                    age++;
                  });
                }
              },
            ),
            SizedBox(width: 10),
            RoundIconButton(
              iconData: FontAwesomeIcons.minus,
              onPressed: () {
                if (!(age < 2)) {
                  setState(() {
                    age--;
                  });
                }
              },
            ),
          ],
        )
      ],
    );
  }

  Widget slideInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "HEIGHT",
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "$height",
              style: kNumberTextStyle,
            ),
            Text(
              "cm",
              style: kLabelTextStyle,
            ),
          ],
        ),
        sliderBMI(),
      ],
    );
  }

  SliderTheme sliderBMI() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: .15,
        activeTrackColor: Colors.white,
        inactiveTrackColor: Color(0xFF8D8E98),
        thumbColor: Color(0xFFEB1555),
        overlayColor: Color(0x1fEB1555), // 0x1f 12 % capacity
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
      ),
      child: Slider(
        onChanged: (value) {
          setState(() {
            height = value.round();
          });
        },
        value: height.toDouble(),
        min: 100.0,
        max: 220.0,
      ),
    );
  }
}
