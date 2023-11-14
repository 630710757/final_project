import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double hight;

  SmallText({super.key,
    this.color = const Color(0xffc7bb9b),
    required this.text,
    this.size = 12,
    this.hight = 1.2
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          height: hight,
      ),
    );
  }
}

