import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class AllProductsController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    try {
      isLoading.value = true;
      error.value = '';
      final result = await _apiService.fetchAllProducts();
      products.assignAll(result);
    } catch (e) {
      error.value = 'Failed to load products.';
    } finally {
      isLoading.value = false;
    }
  }
}
