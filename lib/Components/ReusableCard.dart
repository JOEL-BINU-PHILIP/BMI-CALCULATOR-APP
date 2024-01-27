import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final Function() onPressed;
   ReusableCard({this.colour, this.cardChild , required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        
        height: 180,
        width: 170,
        margin: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}