import 'package:flutter/material.dart';
import 'package:card_share/cardThemes/tenzi_theme.dart';
import 'package:card_share/cardThemes/elipsis_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:card_share/business_model.dart';

enum SocialMedia { facebook, email, linkedin, whatsapp, twitter }

class MyCard extends StatefulWidget {
  final String businessName;
  final String businessType;
  final String businessCategory;
  final String personName;
  final String businessNumber;
  final String ownerEmail;
  final String businessLocation;
  final String businessCity;
  final String barTitle;
  final String selectedCard;

  const MyCard(
      {Key? key,
      required this.businessName,
      required this.businessType,
      required this.businessCategory,
      required this.personName,
      required this.businessNumber,
      required this.ownerEmail,
      required this.businessLocation,
      required this.businessCity,
      required this.barTitle,
      required this.selectedCard})
      : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  // BusinessModel myCardData = BusinessModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu),
        title: Text(widget.barTitle),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 20, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "3. Your Selected Card is ready for share",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          if (widget.selectedCard == "tenziStyle")
            Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // height: 300,
                // alignment: Alignment.center,
                children: <Widget>[
                  TenziStyle(
                      businessName: widget.businessName,
                      businessType: widget.businessName,
                      businessCategory: widget.businessCategory,
                      personName: widget.personName,
                      businessNumber: widget.businessNumber,
                      ownerEmail: widget.ownerEmail,
                      businessLocation: widget.businessLocation,
                      businessCity: widget.businessCity,
                      callback: (value) {})
                ]),
          if (widget.selectedCard == "elipsiStyle")
            Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElipsiStyle(
                      businessName: widget.businessName,
                      businessType: widget.businessName,
                      businessCategory: widget.businessCategory,
                      personName: widget.personName,
                      businessNumber: widget.businessNumber,
                      ownerEmail: widget.ownerEmail,
                      businessLocation: widget.businessLocation,
                      businessCity: widget.businessCity,
                      callback: (value) {}),
                ]),
          const SizedBox(
            height: 70,
          ),
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 15, 0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    shareData(SocialMedia.email, "subject", "text");
                  },
                  icon: const Icon(FontAwesomeIcons.whatsapp),
                  label: const Text("")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    shareData(SocialMedia.twitter, "subject", "text");
                  },
                  icon: const Icon(FontAwesomeIcons.twitter),
                  label: const Text("")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: ElevatedButton.icon(
                  // style: ButtonStyle(),
                  onPressed: () async {
                    shareData(SocialMedia.email, "subject", "text");
                  },
                  icon: const Icon(FontAwesomeIcons.message),
                  label: const Text("")),
            ),
          ]),
        ],
      ),
    );
  }
}

Future shareData(SocialMedia socialPlatform, final subject, final text) async {
  final urlShare =
      Uri.encodeComponent("https://www.youtube.com/watch?v=bWehAFTFc9o");
  final Map<SocialMedia, String> urls = {
    SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$text\nurlShare',
    SocialMedia.twitter:
        'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
    SocialMedia.linkedin:
        'https://www.linkendin.com/shareArticle?mini=true&url=$urlShare',
    SocialMedia.email: 'mailto:?subject=$subject&body=$text\n\n$urlShare',
  };

  final url = Uri.parse(urls[socialPlatform]!);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}
