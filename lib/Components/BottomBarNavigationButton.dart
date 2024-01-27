import 'package:flutter/material.dart';
import 'konstants.dart';
class BottomBarNavigationButton extends StatelessWidget {
  final String barDAta;
  const BottomBarNavigationButton({
    super.key,required this.barDAta
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      color: klastContainerColour,
      child: Center(
        child: Text(
          barDAta,
          style: kBottomBarTextStyle,
        ),
      ),
    );
  }
}