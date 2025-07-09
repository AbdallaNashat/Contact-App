import 'package:flutter/material.dart';
import 'package:newcontact/core/constants/color_palette.dart';
import 'package:newcontact/models/contact.dart';

class ContactCard extends StatelessWidget {
  Contact contact;
  int index;
  Function onClick;

  ContactCard(
      {super.key,
      required this.contact,
      required this.index,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.file(
              contact.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.email,
                    color: ColorPalette.darkBlue,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      contact.email,
                      style: TextStyle(color: ColorPalette.darkBlue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.phone_android_outlined,
                    color: ColorPalette.darkBlue,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      contact.number,
                      style: TextStyle(color: ColorPalette.darkBlue),
                    ),
                  ),
                ],
              ),
              FilledButton(
                onPressed: () {
                  onClick(index);
                },
                style: FilledButton.styleFrom(
                    backgroundColor: ColorPalette.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.delete),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('Delete'),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
