import 'package:flutter/material.dart';
import 'package:newcontact/core/constants/app_assets.dart';
import 'package:newcontact/core/constants/color_palette.dart';
import 'package:newcontact/core/home/widgets/custom_text_field.dart';
import 'package:newcontact/core/home/widgets/empty_list_widget.dart';
import 'package:newcontact/models/contact.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];

  //Contact(File("Asd"), "name", "number", "email")
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                AppAssets.contact,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            contacts.isEmpty
                ? EmptyListWidget()
                : Expanded(
                    child: Container(
                    color: Colors.blue,
                  )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModalBottomSheet();
        },
        backgroundColor: ColorPalette.gold,
        foregroundColor: ColorPalette.darkBlue,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showModalBottomSheet() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: ColorPalette.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16.0),
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(
          children: [
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
                } else if (RegExp(
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
                onPressed: () {},
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
