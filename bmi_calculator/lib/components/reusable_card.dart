import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color col;
  final Widget cardChild;
  final Function onClick;

  ReusableCard({@required this.col, this.cardChild, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
