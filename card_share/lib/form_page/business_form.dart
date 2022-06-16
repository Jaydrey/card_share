import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../business_model.dart';
import 'package:card_share/final_card/processed_card.dart';

class BuildForm extends StatefulWidget {
  final String barTitle;
  final String selectedCard;
  const BuildForm(
      {Key? key, required this.barTitle, required this.selectedCard})
      : super(key: key);
  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  BusinessModel bizModel = BusinessModel();
  String businessName = "";
  String businessCategory = "";
  String businessType = "";
  String personName = "";
  String businessNumber = "";
  String ownerEmail = "";
  String businessLocation = "";
  String businessCity = "";
  String businessCode = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: globalKey,
      child: ListView(
        // reverse: true,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          buildBusinessName(),
          const SizedBox(height: 16),
          buildBusinessType(),
          const SizedBox(
            height: 16,
          ),
          buildBusinessLocation(),
          const SizedBox(
            height: 16,
          ),
          buildOwnerName(),
          const SizedBox(height: 16),
          buildMobileNumber(),
          const SizedBox(height: 16),
          buildEmail(),
          const SizedBox(height: 16),
          buildAddButton(),
          const SizedBox(height: 16),

          // buildImage(bytes1),
        ],
      ),
    );
  }

  Widget buildBusinessName() => TextFormField(
        onChanged: (value) {
          setState(() {
            businessName = value;
            // print(widget.myName);
          });
          bizModel.businessName = businessName;
          print(bizModel.businessName);
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.location_city),
          labelText: "Business Name",
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Fill in your business name";
          }
          return null;
        },
      );
  Widget buildBusinessType() => TextFormField(
        onChanged: (value) {
          setState(() {
            businessType = value;
          });
          bizModel.businessType = businessType;
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.card_membership),
          labelText: "Business Type",
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: const OutlineInputBorder(),
        ),
      );
  // Widget buildBusinessCategory() =>
  Widget buildBusinessLocation() => TextFormField(
        onChanged: (value) {
          setState(() {
            businessLocation = value;
          });
          bizModel.businessLocation = businessLocation;
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.location_pin),
          labelText: "Business Address",
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {},
      );
  Widget buildOwnerName() => TextFormField(
        onChanged: (value) {
          setState(() {
            personName = value;
          });
          bizModel.personName = personName;
          print(bizModel.personName);
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.person),
          labelText: "Owner Name",
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null) {
            return "Fill in atleast your two names";
          }
          return null;
        },
      );
  Widget buildMobileNumber() => TextFormField(
        onChanged: (value) {
          setState(() {
            businessNumber = value;
          });
          bizModel.businessNumber = businessNumber;
          print(bizModel.businessNumber);
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.phone_android),
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          labelText: "Mobile Number",
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length != 10) {
            return "Fill in your correct mobile number";
          }
          return null;
        },
      );
  Widget buildEmail() => TextFormField(
        onChanged: (value) {
          setState(() {
            ownerEmail = value;
          });
          bizModel.ownerEmail = ownerEmail;
        },
        validator: (value) {
          String email = value as String;
          if (!EmailValidator.validate(email)) {
            return "Enter a valid email";
          }
          return null;
        },
        decoration: InputDecoration(
          icon: const Icon(Icons.email),
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          labelText: "Owner Email",
          border: const OutlineInputBorder(),
        ),
      );

  Widget buildAddButton() => Builder(
        builder: (context) => ElevatedButton(
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                globalKey.currentState!.save();
                print(bizModel.toJson());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyCard(
                          businessName: businessName,
                          businessType: businessType,
                          businessCategory: businessCategory,
                          personName: personName,
                          businessNumber: businessNumber,
                          ownerEmail: ownerEmail,
                          businessLocation: businessLocation,
                          businessCity: businessCity,
                          barTitle: widget.barTitle,
                          selectedCard: widget.selectedCard)),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple.shade500,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            ),
            child: const Text(
              "Save",
              style: TextStyle(fontSize: 20),
            )),
      );
}
