import 'package:final_project/pages/food/recommended_food_detail.dart';
import 'package:final_project/pages/home/food_body.dart';
import 'package:final_project/pages/home/main_food.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper{
   static const String initial="/";

   static List<GetPage> routes=[
     GetPage(name: "/", page: ()=>ReeommenedFoodDetail()),
   ];
}