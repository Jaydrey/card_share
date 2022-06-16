import 'package:flutter/material.dart';
import 'package:card_share/business_model.dart';

// typedef void StringCallback(String val);

class TenziStyle extends StatefulWidget {
  final String businessName;
  final String businessType;
  final String businessCategory;
  final String personName;
  final String businessNumber;
  final String ownerEmail;
  final String businessLocation;
  final String businessCity;
  final Function(String) callback;

  const TenziStyle({
    Key? key,
    required this.businessName,
    required this.businessType,
    required this.businessCategory,
    required this.personName,
    required this.businessNumber,
    required this.ownerEmail,
    required this.businessLocation,
    required this.businessCity,
    required this.callback,
  }) : super(key: key);

  @override
  State<TenziStyle> createState() => _TenziStyleState();
}

class _TenziStyleState extends State<TenziStyle> {
  BusinessModel bizModel = BusinessModel();

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width - 80.0;
    // const double cardHeight = 190.0;
    const double cardRadius = 5;
    const double cardPad = 20;
    const double cardMargin = 10;

    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        const snackBar = SnackBar(content: Text('Tapped on tenzi theme'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Tapped on tenzi theme");
        widget.callback("tenziStyle");
      },
      // onDoubleTap: null,
      child: Container(
        padding: const EdgeInsets.all(cardPad),
        margin: const EdgeInsets.fromLTRB(cardMargin, 0, 10, cardMargin),
        width: cardWidth,
        // height: cardHeight,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 36, 40, 59),
          borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .7),
              offset: Offset(5, 5),
              blurRadius: cardRadius,
              spreadRadius: 3,
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
              child: Text(
                widget.businessName,
                style: const TextStyle(
                    color: Color.fromARGB(255, 206, 147, 216),
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                widget.businessCategory,
                style: const TextStyle(
                    color: Color.fromARGB(255, 206, 147, 216),
                    fontFamily: "Montserrat",
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 2),
              child: Text(widget.personName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 206, 147, 216),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Text(widget.businessNumber,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 206, 147, 216),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Icon(
                    Icons.add_business,
                    color: Color.fromARGB(255, 206, 147, 216),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    widget.businessLocation,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 206, 147, 216),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
