// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:final_project/wigets/app_icon.dart';
import 'package:final_project/wigets/big_text.dart';
import 'package:final_project/wigets/exandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/utils/dimensions.dart';

class ReeommenedFoodDetail extends StatelessWidget {
  static const routeName = 'recommended_food_detail';
  const ReeommenedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                  size: Dimension.font26,
                  text: "Italian Side",
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius20),
                    topRight: Radius.circular(Dimension.radius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.deepOrange,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food2.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: ExpanableText(
                    text:
                        "This easy pizza dough recipe is great for beginners and produces a soft homemade pizza crust. Skip the pizza delivery because you only need 6 basic ingredients to begin! This recipe is brought to you in partnership with Red Star Yeast. Every great pizza begins with a great pizza crust. Some like it thin and crispy, while others prefer a thick and soft crust. This homemade pizza crust has it all: soft & chewy with a delicious crisp and AWESOME flavor. It’s my go-to pizza dough recipe and just a glance at the hundreds of reviews in the comments section tells me that it’s a favorite for many others too! All pizza dough starts with the same basic ingredients: flour, yeast, water, salt, and olive oil. Here’s the breakdown of what I use in my homemade pizza crust recipe. The full printable recipe is below."),
                margin: EdgeInsets.only(
                    left: Dimension.width20, right: Dimension.width20),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimension.width20*2.5,
              right: Dimension.width20*2.5,
              top: Dimension.height10,
              bottom: Dimension.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimension.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    icon: Icons.remove),
                BigText(text: "\$13.55 "+" X "+" 0 ",color: Colors.black,size: Dimension.font26,),

                AppIcon(
                  iconSize: Dimension.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    icon: Icons.add),
              ],

            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: Colors.deepOrange,

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
          )
        ],
      ),
    );
  }
}
