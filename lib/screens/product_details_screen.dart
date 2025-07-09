import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/product_controller.dart';
import '../controllers/cart_controller.dart';
import '../widgets/loading_widget.dart';

class ProductDetailsScreen extends GetView<ProductController> {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    final int productId = Get.arguments as int;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value ||
            controller.currentProduct.value == null) {
          controller.loadProduct(productId);
          return LoadingWidget();
        }

        final product = controller.currentProduct.value!;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Container(
                      height: 280,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: 1,
                        onPageChanged: (index) {},
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: CachedNetworkImage(
                                imageUrl: product.image,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey[50],
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Color(0xFFFF5722),
                                  )),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.grey[50],
                                  child: Icon(Icons.image,
                                      size: 60, color: Colors.grey),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Page Indicator
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Container(
                          width: index == 0 ? 8 : 6,
                          height: index == 0 ? 8 : 6,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: index == 0 ? Colors.black : Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24),

                    // Product Info
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wireless Headphone',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$520.00',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF5722),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.white, size: 14),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '(320 Review)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Seller: Tariqul isalm',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 24),

                          // Color Selection
                          Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              _buildColorOption(
                                  Color(0xFF8B0000), 0, true), // Dark red
                              _buildColorOption(Colors.black, 1, false),
                              _buildColorOption(
                                  Color(0xFF1E3A8A), 2, false), // Blue
                              _buildColorOption(
                                  Color(0xFF8B4513), 3, false), // Brown
                              _buildColorOption(Colors.grey[300]!, 4, false),
                            ],
                          ),

                          SizedBox(height: 32),

                          // Tabs
                          DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                Container(
                                  height: 45,
                                  child: TabBar(
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.grey[600],
                                    indicator: BoxDecoration(
                                      color: Color(0xFFFF5722),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    labelPadding: EdgeInsets.zero,
                                    tabs: [
                                      Container(
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Text('Description',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Container(
                                        height: 35,
                                        alignment: Alignment.center,
                                        child: Text('Specifications',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Container(
                                        height: 35,
                                        alignment: Alignment.center,
                                        child: Text('Reviews',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 100,
                                  alignment: Alignment.topLeft,
                                  child: TabBarView(
                                    children: [
                                      Text(
                                        'Lorem ipsum dolor sit amet consectetur. Placerat in semper vitae a. Blandit amet purus eget sed vitae morbi tellus. Integer ornare. Purus risus urna sed fermentum. Neque dolor tempus egestas nunc volutpat ullamcorper dignissim velit.',
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1.5,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Text(
                                        'Specifications coming soon...',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14),
                                      ),
                                      Text(
                                        'Reviews coming soon...',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.remove, color: Colors.white, size: 18),
                        Text('1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Icon(Icons.add, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          cartController.addToCart(product);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF5722),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildColorOption(Color color, int index, bool isSelected) {
    return GestureDetector(
      onTap: () => controller.selectColor(index),
      child: Container(
        width: 36,
        height: 36,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
