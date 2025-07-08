import 'package:flutter/material.dart';
import 'package:newcontact/core/constants/color_palette.dart';

typedef CustomTextFieldCallBack = String? Function(String value);

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final CustomTextFieldCallBack validator;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => validator(value!),
          style: TextStyle(fontSize: 16, color: ColorPalette.gold),
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorPalette.gold),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorPalette.gold),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorPalette.gold),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorPalette.gold),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 16, color: ColorPalette.gold),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
