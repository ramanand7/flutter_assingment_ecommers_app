import 'dart:ui';

import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  final ApiService _apiService = Get.find();

  var products = <Product>[].obs;
  var currentProduct = Rx<Product?>(null);
  var isLoading = false.obs;
  var selectedColorIndex = 0.obs;

  void loadProductsByCategory(String category) async {
    try {
      isLoading.value = true;
      products.clear();

      final data = await _apiService.getProductsByCategory(category);
      products.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void loadProduct(int id) async {
    try {
      isLoading.value = true;

      final product = await _apiService.getProduct(id);
      currentProduct.value = product;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load product: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectColor(int index) {
    selectedColorIndex.value = index;
  }

  List<Color> get availableColors => [
        Color(0xFF8B2635),
        Color(0xFF2C2C2C),
        Color(0xFF2E5BBA),
        Color(0xFF8B4513),
        Color(0xFFE5E5E5),
      ];
}
