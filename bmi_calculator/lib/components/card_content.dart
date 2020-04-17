import 'package:flutter/material.dart';
import '../constants.dart';

class cardContent extends StatelessWidget {
  final iconForCard;
  final textForCard;

  cardContent({this.iconForCard, this.textForCard});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconForCard,
          size: 100.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textForCard,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
