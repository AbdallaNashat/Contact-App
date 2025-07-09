import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newcontact/core/constants/app_assets.dart';
import 'package:newcontact/core/constants/color_palette.dart';

class InputCard extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final File? image;

  Function onClick;

  InputCard(
      {super.key,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.onClick,
      this.image});

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await widget.onClick();
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2,
                        color: ColorPalette.gold,
                      )),
                  child: widget.image == null
                      ? Lottie.asset(AppAssets.imagePicker)
                      : Image.file(
                          widget.image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          //lottie.assets(AppAssets.imagePickerAnimation:Image.file(image!)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: widget.nameController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? "User Name" : value.text,
                    style: TextStyle(fontSize: 20, color: ColorPalette.gold),
                  ),
                ),
                Divider(
                  color: ColorPalette.gold,
                ),
                ValueListenableBuilder(
                  valueListenable: widget.emailController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? "example@example.com" : value.text,
                    style: TextStyle(fontSize: 20, color: ColorPalette.gold),
                  ),
                ),
                Divider(
                  color: ColorPalette.gold,
                ),
                ValueListenableBuilder(
                  valueListenable: widget.phoneController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? "+20 123 456 789" : value.text,
                    style: TextStyle(fontSize: 20, color: ColorPalette.gold),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
