import 'package:flutter/material.dart';
import 'business_form.dart';


class BusinessFormPage extends StatefulWidget {
  final String barTitle;
  const BusinessFormPage({Key? key, required this.barTitle}) : super(key: key);
  @override
  State<BusinessFormPage> createState() => _BusinessFormPageState();
}

class _BusinessFormPageState extends State<BusinessFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu),
        title: Text(widget.barTitle),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildFirstHeading(),
            buildSubHeading(),
            // the business form imported from the business_form module
            const BuildForm(),
          ],
        ),
      )),
    );
  }

  // first heading step 2
  Widget buildFirstHeading() => const Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Text(
          "Step 2",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        ),
      );
  // sunheading widget fill forms
  Widget buildSubHeading() => const Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
        child: FittedBox(
          alignment: Alignment.centerRight,
          child: Text(
            "Fill in the required fields for your card",
            style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ),
      );
}
