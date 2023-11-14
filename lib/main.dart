//import 'package:final_project/home/main_food.dart';
import 'package:final_project/controllers/popular_product_controller.dart';
import 'package:final_project/pages/food/popular_food_detail.dart';
import 'package:final_project/pages/food/recommended_food_detail.dart';
import 'package:final_project/pages/home/food_body.dart';
import 'package:final_project/pages/home/main_food.dart';
import 'package:final_project/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'heiper/dependencies.dart' as dep;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MainFoodPage(),
      //initialRoute: RouteHelper.initial,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MainFoodPage(),
      //   ReeommenedFoodDetail.routeName: (context) => ReeommenedFoodDetail(),
      // },
    );
  }
}

