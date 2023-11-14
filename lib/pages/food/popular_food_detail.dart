// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/wigets/app_column.dart';
import 'package:final_project/wigets/app_icon.dart';
import 'package:final_project/wigets/big_text.dart';
import 'package:final_project/wigets/exandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../wigets/icon_and_text.dart';
import '../../wigets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularFoodImgSize-20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/food2.jpg"),
                ),
              ),
            ),
          ),
          Positioned(
              top: Dimension.height45,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimension.popularFoodImgSize,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimension.radius20),
                  topLeft: Radius.circular(Dimension.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  AppColumn(text: "Italian side"),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  BigText(text: "Introduce"),
                  Expanded(
                    child: SingleChildScrollView(
                        child: ExpanableText(text: "This easy pizza dough recipe is great for beginners and produces a soft homemade pizza crust. Skip the pizza delivery because you only need 6 basic ingredients to begin! This recipe is brought to you in partnership with Red Star Yeast. Every great pizza begins with a great pizza crust. Some like it thin and crispy, while others prefer a thick and soft crust. This homemade pizza crust has it all: soft & chewy with a delicious crisp and AWESOME flavor. It’s my go-to pizza dough recipe and just a glance at the hundreds of reviews in the comments section tells me that it’s a favorite for many others too!")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimension.height30,
            bottom: Dimension.height30,
            left: Dimension.width20,
            right: Dimension.width20,
        ),
        decoration: BoxDecoration(
          color: Color(0xecf1e9e9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.radius20*2),
            topRight: Radius.circular(Dimension.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: Color(0xe79d9b9b),),
                  SizedBox(width: Dimension.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimension.width10/2,),
                  Icon(Icons.add,color: Color(0xe79d9b9b),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimension.height20,
                bottom: Dimension.height20,
                left: Dimension.width20,
                right: Dimension.width20,
              ),
              child: BigText(text: "\$15 | Add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
