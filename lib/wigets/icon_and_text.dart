// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:final_project/wigets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_project/utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimension.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}
