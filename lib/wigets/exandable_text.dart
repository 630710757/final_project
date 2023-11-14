import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/wigets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpanableText extends StatefulWidget {
  final String text;

  const ExpanableText({super.key, required this.text});

  @override
  State<ExpanableText> createState() => _ExpanableTextState();
}

class _ExpanableTextState extends State<ExpanableText> {
  late String firstHalf;
  late String secondfHalf;

  bool hiddenText = true;

  double textHeight = Dimension.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondfHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondfHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondfHalf.isEmpty
          ? SmallText(
          size: Dimension.font16,
          text: firstHalf)
          : Column(
              children: [
                SmallText(
                    hight:1.8,
                    color: Colors.grey,
                    size: Dimension.font16,
                    text: hiddenText
                        ? (firstHalf + ".......")
                        : (firstHalf + secondfHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: Colors.deepOrange,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
