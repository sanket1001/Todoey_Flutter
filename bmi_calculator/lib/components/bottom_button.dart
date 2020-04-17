import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTxt;
  final Function onTap;
  BottomButton({@required this.buttonTxt, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTxt,
            style: kBottomButtonText,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kBottomBarColor,
        width: double.infinity,
        height: kBottomBarHeight,
      ),
    );
  }
}
