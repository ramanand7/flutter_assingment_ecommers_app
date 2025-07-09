import 'dart:convert';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApiService extends GetxService {
  static const String productsBox = 'productsBox';
  static const String productsKey = 'products';

  // Call this in main() before runApp
  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(productsBox);
  }

  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<String>> getCategories() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/products/categories'));
      if (response.statusCode == 200) {
        return List<String>.from(json.decode(response.body));
      }
      throw Exception('Failed to load categories');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<List<Product>> getProducts() async {
    final box = Hive.box(productsBox);
    // No need for networkAvailable flag, logic is handled by try/catch and cache fallback
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        // Cache the response
        await box.put(productsKey, response.body);
        return data.map((item) => Product.fromJson(item)).toList();
      }
      throw Exception('Failed to load products');
    } catch (e) {
      // On error, try to load from cache
      final cached = box.get(productsKey);
      if (cached != null) {
        List<dynamic> data = json.decode(cached);
        return data.map((item) => Product.fromJson(item)).toList();
      }
      throw Exception('Network error: $e');
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products/category/$category'),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => Product.fromJson(item)).toList();
      }
      throw Exception('Failed to load products');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<Product> getProduct(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products/$id'));
      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      }
      throw Exception('Failed to load product');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<List<Product>> fetchAllProducts() async {
    return await getProducts();
  }
}
