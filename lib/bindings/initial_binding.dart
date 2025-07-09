import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../services/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService(), permanent: true);
    Get.put(CartController(), permanent: true);
  }
}
