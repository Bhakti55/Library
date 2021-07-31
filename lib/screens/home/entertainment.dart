import 'package:flutter/material.dart';
import 'package:library_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Entertainment extends StatelessWidget {
  Entertainment({Key? key}) : super(key: key);

  List entertainmentList = [
    ["Java ", "https://www.youtube.com/watch?v=8cm1x4bC610"],
    ["Android", "https://www.youtube.com/watch?v=mXjZQX3UzOs"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(title: Text("Entertainment"),),
      body:  ListView.builder
        (
          itemCount: entertainmentList.length,
          itemBuilder: (BuildContext ctxt, int Index) {
            return GestureDetector (
              onTap: () async {
                if (await canLaunch(entertainmentList[Index][1])) {
                  await launch(entertainmentList[Index][1]);
                } else {
                  throw 'Could not launch ${entertainmentList[Index][1]}';
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(entertainmentList[Index][0]),
                )),
              ),
            );
          }
      ),
    );
  }
}
