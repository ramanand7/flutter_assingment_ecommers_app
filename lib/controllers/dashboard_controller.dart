import 'dart:async';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class DashboardController extends GetxController {
  final ApiService _apiService = Get.find();

  var searchQuery = ''.obs;
  var isLoading = false.obs;
  var isSearching = false.obs;
  var isGridView = true.obs;
  var filteredProducts = <Product>[].obs;
  var featuredProducts = <Product>[].obs;
  var categories = <String>[].obs;
  List<Product> allProducts = <Product>[];

  // Wishlist feature
  final RxSet<int> _wishlist = <int>{}.obs;

  List<int> get wishlist => _wishlist.toList();

  // Bottom navigation index
  final RxInt currentBottomNavIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    try {
      isLoading.value = true;

      final categoriesData = await _apiService.getCategories();
      final productsData = await _apiService.getProducts();

      categories.value = categoriesData;
      featuredProducts.value = productsData.toList();
      allProducts = productsData.toList();
      filteredProducts.value = productsData.toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void onBannerChanged(int index) {
    // No-op or implement if needed
  }

  String getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'electronics':
        return '📱';
      case 'jewelery':
        return '💎';
      case "men's clothing":
        return '👔';
      case "women's clothing":
        return '👗';
      default:
        return '🛍️';
    }
  }

  void searchProducts(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredProducts.clear();
      return;
    }
    isSearching.value = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      filteredProducts.value = allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) ||
              product.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
      isSearching.value = false;
    });
  }

  void clearSearch() {
    searchQuery.value = '';
    filteredProducts.clear();
  }

  void toggleView() {
    isGridView.value = !isGridView.value;
  }

  bool isInWishlist(int id) {
    return _wishlist.contains(id);
  }

  void toggleWishlist(int id) {
    if (_wishlist.contains(id)) {
      _wishlist.remove(id);
      Get.snackbar('Wishlist', 'Removed from wishlist',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      _wishlist.add(id);
      Get.snackbar('Wishlist', 'Added to wishlist',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateBottomNavIndex(int index) {
    currentBottomNavIndex.value = index;
  }
}
