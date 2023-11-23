import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;

Color primaryColor = Color(0xff1175A5);
Color secondaryColor = Color(0xffD9D8D9);
Color thirdColor = Color(0xff4D4D4D);

Color primaryTextColor = Color(0xff1F1F1F);
Color secondaryTextColor = Color(0xff7D7D7D);

Color thirdTextColor = Color(0xffFFFFFF);

TextStyle primaryTextStyle = GoogleFonts.inriaSans(
  color: primaryTextColor,
);
TextStyle secondaryTextStyle = GoogleFonts.inriaSans(
  color: secondaryTextColor,
);
TextStyle thirdTextStyle = GoogleFonts.inriaSans(
  color: primaryColor,
);
TextStyle buttonTextStyle = GoogleFonts.inriaSans(
  color: thirdTextColor,
);

FontWeight light = FontWeight.w100;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
