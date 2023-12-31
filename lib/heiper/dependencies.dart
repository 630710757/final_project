import 'package:final_project/controllers/popular_product_controller.dart';
import 'package:final_project/data/api/api_client.dart';
import 'package:final_project/data/respository/popular_product_repo.dart';
import 'package:final_project/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init()async{
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}