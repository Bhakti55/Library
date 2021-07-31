import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/constants.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Suggestions extends StatefulWidget {

  Suggestions({Key? key, }) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {

  RoundedLoadingButtonController _button = RoundedLoadingButtonController();
  TextEditingController suggestion = TextEditingController();

  void initState() {
    super.initState();
   // getProfile(this.context);
  }

  createGrievance(BuildContext buildContext) async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feedback"),
          actions: [
            GestureDetector(
              onTap: () {
             /*   Navigator.push(context, MaterialPageRoute(
                    builder: (context) => History(pfnumber: member.pfnumber.toString(),)));*/
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 10),
                  child: Column(
                    children: [
                      Icon(Icons.history),
                      Text("History")
                    ],
                  )
              ),
            )
          ],
        ),
        body: Builder (
          builder: (BuildContext buildContext) => Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Please Give Your Feedback/ Suggestions", style: TextStyle(fontSize: 16),)),
              Padding(
                padding: EdgeInsets.all(10),
                child: Material(
                    child: TextField(
                      controller: suggestion,
                      maxLines: null,
                      decoration: InputDecoration(
                        border:  OutlineInputBorder(),
                      ),
                    )
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 80, 0),
                  child: RoundedLoadingButton(
                    color: kPrimaryColor,
                    controller: _button,
                    onPressed: () {
                        _button.error();
                        _button.reset();
                    },
                    child: Text("SUBMIT",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        fontSize: 18.0,
                      ),),
                  //  color: HARDCODED______.primary2,
                  )
              ),
            ],
          ),
        ));
  }
}
