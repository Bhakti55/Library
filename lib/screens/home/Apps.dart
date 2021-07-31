import 'package:flutter/material.dart';
import 'package:library_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Apps extends StatefulWidget {
   Apps({Key? key}) : super(key: key);

  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  List litems = [
    ["Kalnirnay", "https://play.google.com/store/apps/details?id=com.awt.kalnirnay&hl=en_IN&gl=US"]
  ];

  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text("Apps"),
      ),
      body: ListView.builder
        (
          itemCount: litems.length,
          itemBuilder: (BuildContext ctxt, int Index) {
            return GestureDetector (
              onTap: () async {
                if (await canLaunch(litems[Index][1])) {
                await launch(litems[Index][1]);
                } else {
                throw 'Could not launch ${litems[Index][1]}';
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(litems[Index][0]),
                )),
              ),
            );
          }
      )
    );
  }
}
