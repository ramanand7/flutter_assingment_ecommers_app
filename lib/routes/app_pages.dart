import '../screens/profile_screen.dart';
import 'package:get/get.dart';
import '../screens/splash_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/category_products_screen.dart';
import '../screens/all_products_screen.dart';
import '../bindings/splash_binding.dart';
import '../bindings/dashboard_binding.dart';
import '../bindings/product_binding.dart';
import '../bindings/cart_binding.dart';
import '../bindings/all_products_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAILS,
      page: () => ProductDetailsScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.CART,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.CATEGORY_PRODUCTS,
      page: () => CategoryProductsScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.ALL_PRODUCTS,
      page: () => AllProductsScreen(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfileScreen(),
    ),
  ];
}
