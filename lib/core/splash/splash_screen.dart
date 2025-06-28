import 'package:flutter/material.dart';
import 'package:newcontact/core/constants/app_assets.dart';
import 'package:newcontact/core/constants/color_palette.dart';
import 'package:newcontact/core/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String  routeName = "/splash";
  const SplashScreen({super.key});
  static final _duration = Duration(seconds: 2);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(SplashScreen._duration, () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.darkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.splashLogo,
            height: size.height * 0.25,
            width: size.width * 0.25,
          ),
        ],
      ),
    );
  }
}
