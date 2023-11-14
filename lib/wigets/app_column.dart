// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/wigets/big_text.dart';
import 'package:final_project/wigets/icon_and_text.dart';
import 'package:final_project/wigets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimension.font26,),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.deepOrange,
                  size: 15,
                );
              }),
            ),
            SizedBox(width: 10,),
            SmallText(text: '3.8'),
            SizedBox(width: 10,),
            SmallText(text: '120'),
            SizedBox(width: 10,),
            SmallText(text: 'comments'),
          ],
        ),
        SizedBox(
          height: Dimension.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: Colors.orange,
            ),
            IconAndText(icon: Icons.location_on,
              text: '1.65 km.',
              iconColor: Colors.yellow,
            ),
            IconAndText(icon: Icons.access_time_rounded,
              text: '25 mins',
              iconColor: Colors.amber,
            ),
          ],
        ),
      ],
    );
  }
}
