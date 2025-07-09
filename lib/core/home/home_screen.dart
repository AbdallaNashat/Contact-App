import 'package:flutter/material.dart';
import 'package:newcontact/core/constants/app_assets.dart';
import 'package:newcontact/core/constants/color_palette.dart';
import 'package:newcontact/core/home/widgets/bottom_sheet_widget.dart';
import 'package:newcontact/core/home/widgets/contact_card.dart';
import 'package:newcontact/core/home/widgets/empty_list_widget.dart';
import 'package:newcontact/models/contact.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Contact(File("Asd"), "name", "number", "email")
  @override
  Widget build(
    BuildContext context,
  ) {
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
            Contact.contacts.isEmpty
                ? EmptyListWidget()
                : Expanded(
                    child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.7),
                    itemBuilder: (context, index) => ContactCard(
                      onClick: (int index) {
                        Contact.contacts.removeAt(index);
                        setState(() {});
                      },
                      contact: Contact.contacts[index],
                      index: index,
                    ),
                    itemCount: Contact.contacts.length,
                  )),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: Contact.contacts.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                Contact.contacts.removeAt(Contact.contacts.length - 1);
                setState(() {});
              },
              backgroundColor: ColorPalette.darkBlue,
              foregroundColor: ColorPalette.gold,
              child: const Icon(Icons.delete),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Visibility(
            visible: Contact.contacts.length <= 6,
            child: FloatingActionButton(
              onPressed: () {
                _showModalBottomSheet();
              },
              backgroundColor: ColorPalette.gold,
              foregroundColor: ColorPalette.darkBlue,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: ColorPalette.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => BottomSheetWidget(),
    );
    setState(() {});
  }
}
