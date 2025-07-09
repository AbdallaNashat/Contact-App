import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcontact/core/constants/color_palette.dart';
import 'package:newcontact/core/home/widgets/custom_text_field.dart';
import 'package:newcontact/core/home/widgets/input_card.dart';
import 'package:newcontact/models/contact.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  File? image;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: MediaQuery
            .of(context)
            .viewInsets,
        child: Wrap(
          children: [
            InputCard(
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              image: image,
              onClick: () async {
                ImagePicker imagePicker = ImagePicker();
                var file = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                );
                if (file != null) {
                  image = File(file.path);

                  setState(() {});
                }
              },
            ),
            CustomTextField(
              controller: nameController,
              hint: 'Enter Contact Name',
              validator: (value) => value.isEmpty ? 'Enter Contact Name' : null,
              textInputType: TextInputType.name,
            ),
            CustomTextField(
              controller: emailController,
              hint: "Enter Contact Email",
              validator: (value) {
                if (value.isEmpty) {
                  return "Enter User Email";
                } else if (!RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                    .hasMatch(value)) {
                  return "Enter Valid Email";
                }
                return null;
              },
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: phoneController,
              hint: "Enter Contact Phone",
              validator: (value) {
                if (value.isEmpty) {
                  return "Enter User phone";
                } else if (RegExp(r"^01[0125][0-9]{8}$").hasMatch(value)) {
                  return "Enter Valid phone";
                }
                return null;
              },
              textInputType: TextInputType.phone,
            ),
            FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (image == null) {
                      return;
                    }
                    Contact.contacts.add(
                        Contact(
                            image!, nameController.text, phoneController.text,
                            emailController.text)
                    );
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: ColorPalette.gold,
                  foregroundColor: ColorPalette.darkBlue,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter User"),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
