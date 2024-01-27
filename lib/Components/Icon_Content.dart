import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'konstants.dart';


class IconWidget extends StatelessWidget {
  final String gender;
  final IconData genderIcon;
  const IconWidget({super.key, required this.gender, required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
          },
          icon: FaIcon(
            genderIcon,
            size: 50,
            color: Color(0xFF8D8E98),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(gender, style: klabelTextStyle)
      ],
    );
  }
}
