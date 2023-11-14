// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/wigets/big_text.dart';
import 'package:final_project/wigets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'food_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimension.height45, bottom: Dimension.height15),
              padding: EdgeInsets.only(
                left: Dimension.width20,
                right: Dimension.width20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "DELIVERY", color: Colors.deepOrange),
                      Row(
                        children: [
                          SmallText(
                            text: "main",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimension.height45,
                      height: Dimension.height45,
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimension.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
