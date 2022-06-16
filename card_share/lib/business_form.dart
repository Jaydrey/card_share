import 'package:flutter/material.dart';
import 'business_model.dart';


class BuildForm extends StatefulWidget {
  const BuildForm({Key? key}) : super(key: key);
  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  BusinessModel bizModel = BusinessModel();
  String businessName = "";
  String businessCategory = "";
  String personName = "";
  String businessNumber = "";
  String businessLocation = "";
  String businessCity = "";
  String businessCode = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: ListView(
        // reverse: true,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          buildBusinessName(),
          const SizedBox(height: 16),
          buildPersonName(),
          const SizedBox(height: 16),
          buildMobileNumber(),
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
        decoration: const InputDecoration(
          labelText: "Business Name",
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Fill in your business name";
          }
          return null;
        },
      );
  Widget buildPersonName() => TextFormField(
        onChanged: (value) {
          setState(() {
            personName = value;
          });
          bizModel.personName = personName;
          print(bizModel.personName);
        },
        decoration: const InputDecoration(
          labelText: "Full Name",
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.split(" ").isEmpty) {
            return "Fill in your business name";
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
        decoration: const InputDecoration(
          labelText: "Mobile Number",
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          // RegExp valRegExp = RegExp(r"^[0-9]+$");
          // int sum = 0;
          if (value!.length != 10) {
            return "Fill in your business name";
          }
          return null;
        },
      );
  Widget buildAddButton() => Builder(
        builder: (context) => ElevatedButton(
            onPressed: () async {},
            style: ElevatedButton.styleFrom(
              primary: Colors.purple.shade500,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            ),
            child: const Text(
              "Add",
              style: TextStyle(fontSize: 20),
            )),
      );
}
