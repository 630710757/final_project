// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:dots_indicator/dots_indicator.dart';
import 'package:final_project/controllers/popular_product_controller.dart';
import 'package:final_project/models/product_model.dart';
import 'package:final_project/utils/app_constants.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:final_project/wigets/app_column.dart';
import 'package:final_project/wigets/big_text.dart';
import 'package:final_project/wigets/icon_and_text.dart';
import 'package:final_project/wigets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("Current value is"+_currPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    //super.dispose();
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        GetBuilder<PopularProductController>(builder: (popularProducts){
          return Container(
            //color: Colors.amberAccent,
            height: Dimension.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                }),
          );
        }) ,
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return new  DotsIndicator(
            dotsCount: 3,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.deepOrange,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        SizedBox(height: Dimension.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimension.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26,),
              ),
              SizedBox(width: Dimension.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing",),
              ),
            ],
          ),
        ),

           ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,bottom: Dimension.height10),
                  child:Row(
                    children: [
                      Container(
                        width : Dimension.ListViewImgSize,
                        height: Dimension.ListViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimension.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/food2.jpg"
                                )
                            )
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: Dimension.ListViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimension.radius20),
                              bottomRight: Radius.circular(Dimension.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimension.width10,right: Dimension.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Nutritious meal in Italian"),
                                SizedBox(height: Dimension.height10,),
                                SmallText(text: "With Italian characteristics"),
                                SizedBox(height: Dimension.height10,),
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1){
        var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1,currScale,1);
        matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()-1){
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);

    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.only(left: Dimension.width10, right: Dimension.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius30),
              color: Color(0xffe3670f),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/food2.jpg"
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimension.radius30, right: Dimension.radius30, bottom: Dimension.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe1d9d9),
                    blurRadius: 5.0,
                    offset: Offset(0,5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimension.height15, left: 15, right: 15),
                child: AppColumn(text: "Italian side",),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
