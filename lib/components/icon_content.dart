import 'package:flutter/material.dart';
import 'package:check_your_bmi/components/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icons;
  final String gender;
  IconContent({this.icons, this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 70,
        ),
        SizedBox(height: 15),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
