import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newcontact/core/constants/app_assets.dart';
import 'package:newcontact/core/constants/color_palette.dart';
import 'package:newcontact/models/contact.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [Contact(File("Asd"), "name", "number", "email")];

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
                ? Column()
                : Expanded(
                    child: Container(
                    color: Colors.blue,
                  ))
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
