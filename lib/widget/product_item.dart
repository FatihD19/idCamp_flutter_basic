import 'package:basic_app/page/chekout_page.dart';
import 'package:basic_app/theme.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold)),
                SizedBox(height: 8),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 8),
                Text('Rp. ' + product.price,
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                        color: Colors.green)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage(product)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 8),
                      Text('Beli',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                              color: Colors.purple)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
