import 'dart:async';

import 'package:basic_app/page/home_page.dart';
import 'package:basic_app/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ic_splash.png'))),
            ),
            Text('Sup Pak Min London',
                style:
                    primaryTextStyle.copyWith(fontSize: 22, fontWeight: bold))
          ],
        ),
      ),
    );
  }
}
