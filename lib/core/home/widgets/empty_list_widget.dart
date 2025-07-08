import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newcontact/core/constants/app_assets.dart';
import 'package:newcontact/core/constants/color_palette.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset(AppAssets.emptyList),
        Text(
          "There is No Contacts Added Here",
          style: TextStyle(
            color: ColorPalette.gold,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ]),
    );
  }
}
