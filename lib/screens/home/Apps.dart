import 'package:flutter/material.dart';
import 'package:library_app/constants.dart';

class Apps extends StatefulWidget {
   Apps({Key? key}) : super(key: key);

  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  List<String> litems = [];

  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text("Apps"),
      ),
      body:  new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: new TextField(
                decoration: InputDecoration(
                  hintText: "Enter the Apps Name to add into the list",
                ),
                controller: eCtrl,
                onSubmitted: (text) {
                  litems.add(text);
                  eCtrl.clear();
                  setState(() {});
                },
              ),
            ),
          ),
          SizedBox(height: 10,),
          new Expanded(
              child: new ListView.builder
                (
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Card(child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text(litems[Index]),
                      )),
                    );
                  }
              )
          )
        ],
      )
    );
  }
}
