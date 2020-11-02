import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  RoundIconButton({@required this.iconData, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      constraints: BoxConstraints.tightFor(width: 46, height: 46),
      shape: CircleBorder(),
      elevation: 6,
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
    );
  }
}
