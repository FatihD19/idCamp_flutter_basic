import 'package:basic_app/theme.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../widget/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        imagePath: 'assets/img_food1.jpg',
        title: 'Soup Ayam RT',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        price: '8000',
      ),
      Product(
        imagePath: 'assets/img_food2.jpg',
        title: 'Soup Enak bgt',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        price: '6000',
      ),
      Product(
        imagePath: 'assets/img_food3.jpg',
        title: 'Sup josss',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        price: '7000',
      ),
      Product(
        imagePath: 'assets/img_food4.jpg',
        title: 'Sop ayam pak min Pontianak',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        price: '9000',
      ),
      Product(
        imagePath: 'assets/img_food2.jpg',
        title: 'Soup Enak bgt',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        price: '6000',
      ),
      Product(
        imagePath: 'assets/img_food3.jpg',
        title: 'Sup josss',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        price: '7000',
      ),
      Product(
        imagePath: 'assets/img_food3.jpg',
        title: 'Sup josss',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        price: '7000',
      ),
      Product(
        imagePath: 'assets/img_food4.jpg',
        title: 'Sop ayam pak min Pontianak',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        price: '9000',
      ),
      // Add more dummy data here
    ];

    Widget profile() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Selamat Datang, ',
                        style: primaryTextStyle.copyWith(fontSize: 20),
                      ),
                      TextSpan(
                        text: 'Rizky',
                        style: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text('Selamat belanja',
                style: secondaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)),
          ],
        ),
      );
    }

    Widget gridProduct() {
      return GridView.builder(
        shrinkWrap: true,
        physics: PageScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 5,
          childAspectRatio: 0.47,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      );
    }

    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
                child: Column(children: [profile(), gridProduct()]))));
  }
}
