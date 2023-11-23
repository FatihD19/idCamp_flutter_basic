import 'package:basic_app/model/product_model.dart';
import 'package:basic_app/page/home_page.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CheckoutPage extends StatefulWidget {
  Product product;
  CheckoutPage(this.product, {super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int item = 1;

  @override
  Widget build(BuildContext context) {
    int price = int.parse(widget.product.price) * item;
    Widget pricing() {
      return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: secondaryColor), // Warna garis tepi merah
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text('Jumlah item',
                        style: primaryTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 18)),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text('$item',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 18)),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text('Total pembelian',
                        style: primaryTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 18)),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text('Rp. $price',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget cartItem() {
      return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset(
                            '${widget.product.imagePath}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 250,
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 160,
                                    child: Text('${widget.product.title}',
                                        style: primaryTextStyle.copyWith(
                                            fontWeight: semiBold,
                                            fontSize: 18)),
                                  ),
                                  SizedBox(height: 8),
                                  Text('Rp. ${widget.product.price}',
                                      style: secondaryTextStyle.copyWith(
                                          fontWeight: semiBold, fontSize: 16)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xffCB247E),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      onPressed: item == 1
                                          ? null
                                          : () {
                                              setState(() {
                                                item--;
                                              });
                                            },
                                    )),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('$item',
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 18, fontWeight: bold)),
                                ),
                                Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          item++;
                                        });
                                      },
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
          ));
    }

    Widget successDialog() {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 48,
                  ),
                  SizedBox(height: 16),
                  Text("Pembayaran Berhasil",
                      style: primaryTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold)),
                  SizedBox(height: 8),
                  Text(
                    "Terima kasih atas pembayaran Anda.",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Kembali Belanja",
                        style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                            color: Colors.purple)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget payBtn() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SizedBox(height: 12),
            pricing(),
            SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return successDialog();
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD13A25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.payment_outlined, color: thirdTextColor),
                      SizedBox(width: 5),
                      Text('Bayar',
                          style: thirdTextStyle.copyWith(
                              color: thirdTextColor,
                              fontWeight: semiBold,
                              fontSize: 24))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.copy_all_outlined),
                Expanded(
                  child: Text(
                      'Dengan melakukan pembayaran, anda telah menyetujui syarat dan ketentuan berlaku',
                      style: secondaryTextStyle.copyWith(fontSize: 12)),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Checkouut', style: buttonTextStyle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(24),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cartItem(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  payBtn(),
                ],
              )
            ],
          )

          // Stack(
          //   children: [
          //     Column(
          //       children: [
          //         cartItem(),
          //       ],
          //     ),
          //     Positioned(
          //       bottom: 0, // Menempatkan total di bagian bawah
          //       left: 0, // Atur posisi horizontal ke kiri
          //       right: 0, // Atur posisi horizontal ke kanan
          //       child: Column(
          //         children: [pricing(), payBtn()],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
