import 'package:card_share/cardThemes/elipsis_theme.dart';
import 'package:flutter/material.dart';
import 'cardThemes/tenzi_theme.dart';
import 'form_page/build_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String barTitle = "Business Card";
    return MaterialApp(
      title: "Business Card Share",
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "Montserrat"),
      home: const BusinessCard(
        barTitle: barTitle,
      ),
    );
  }
}

class BusinessCard extends StatefulWidget {
  final String barTitle;
  const BusinessCard({Key? key, required this.barTitle}) : super(key: key);
  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  String businessName = "TenziBooks";
  String businessCategory = "FinTech COmpany";
  String personName = "Owner Name";
  String businessNumber = "0745036752";
  String businessLocation = "Nairobi";
  String businessCity = "Nairobi";
  String businessCode = "00100";
  String ownerEmail = "Owner Email";
  String _string = "";

  @override
  Widget build(BuildContext context) {
    double screenHeightPadding = MediaQuery.of(context).size.height * .15;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // avoiding the overflow error experienced when widgets go past the screen size
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.barTitle),
        elevation: 3.0,
      ),
      body: SafeArea(
        child: Container(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, screenHeightPadding),
                  child: Column(
                    children: const <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Step 1",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "First step in creating your business card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Choose the card style you wish to create",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 0),
                child: Row(
                  // where the card theme widgets lie
                  children: <Widget>[
                    TenziStyle(
                      businessName: businessName,
                      businessType: businessName,
                      businessCategory: businessCategory,
                      personName: personName,
                      businessNumber: businessNumber,
                      ownerEmail: ownerEmail,
                      businessLocation: businessLocation,
                      businessCity: businessCity,
                      callback: (value) {
                        setState(() {
                          _string = value;
                        });
                      },
                    ),
                    ElipsiStyle(
                      businessName: businessName,
                      businessType: businessName,
                      businessCategory: businessCategory,
                      personName: personName,
                      businessNumber: businessNumber,
                      ownerEmail: ownerEmail,
                      businessLocation: businessLocation,
                      businessCity: businessCity,
                      callback: (value) {
                        setState(() {
                          _string = value;
                        });
                      },
                    ),
                    TenziStyle(
                      businessName: businessName,
                      businessType: businessName,
                      businessCategory: businessCategory,
                      personName: personName,
                      businessNumber: businessNumber,
                      ownerEmail: ownerEmail,
                      businessLocation: businessLocation,
                      businessCity: businessCity,
                      callback: (value) {
                        setState(() {
                          _string = value;
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusinessFormPage(
                                  barTitle: widget.barTitle,
                                  selectedCard: _string,
                                )));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text("Next"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
