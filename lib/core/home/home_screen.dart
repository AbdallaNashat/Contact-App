import 'package:flutter/material.dart';
import 'package:newcontact/core/constants/app_assets.dart';
import 'package:newcontact/core/constants/color_palette.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBlue,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.contact , height: MediaQuery.of(context).size.height * 0.05, ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
      backgroundColor: ColorPalette.gold,
        foregroundColor: ColorPalette.darkBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
