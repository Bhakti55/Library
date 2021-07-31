import 'package:flutter/material.dart';
import 'package:library_app/constants.dart';
import 'package:library_app/screens/home/Apps.dart';
import 'package:library_app/screens/home/books.dart';
import 'package:library_app/screens/home/entertainment.dart';
import 'package:library_app/screens/home/feedback.dart';
import 'package:library_app/screens/welcome/welcome_screen.dart';
import 'package:like_button/like_button.dart';

enum DRAWER_MENU_OPTIONS {
  entertainment, books, apps, feedback, logout
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List item = [];

  @override
  void initState() {
    initSpecificInformation();
    super.initState();
  }

  void initSpecificInformation() {
    item = [
      [DRAWER_MENU_OPTIONS.entertainment, "Entertainment", Icons.add_a_photo],
      [DRAWER_MENU_OPTIONS.books, "Books", Icons.book],
      [DRAWER_MENU_OPTIONS.apps, "Apps", Icons.apps],
      [DRAWER_MENU_OPTIONS.feedback, "Feedback", Icons.feedback],
      [DRAWER_MENU_OPTIONS.logout, "Logout", Icons.logout],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 180,),
          //  Header(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.2,
                children: List.generate(item.length, (index) {
                    return  GestureDetector(
                        onTap: () async {
                          switch (item[index][0]) {
                            case DRAWER_MENU_OPTIONS.entertainment :
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Entertainment()));
                              break;
                            case DRAWER_MENU_OPTIONS.books:
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Books()));
                              break;
                            case DRAWER_MENU_OPTIONS.apps:
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Apps()));
                              break;
                            case DRAWER_MENU_OPTIONS.feedback:
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
                              break;
                            case DRAWER_MENU_OPTIONS.logout:
                            //  Navigator.pushAndRemoveUntil(context, (route) => WelcomeScreen(), (route) => );
                              break;
                          }
                        },

                        child: Container(
                            height: 70,
                            width: double.infinity,
                            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 11.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.0) //                 <--- border radius here
                              ),
                            ),

                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Container(

                                            height: 20,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              //color: ((index % 4 == 1) || index % 4 == 2) ? HARDCODED______.primary2 : Colors.deepPurple,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(item[index][2], size: 28, color: Colors.white,)
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          //  padding: EdgeInsets.only(left: 10,top: 10),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child:
                                              Text(
                                                item[index][1],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 17, color: Colors.purple, fontWeight: FontWeight.bold,
                                                ),
                                              )
                                          ),
                                        )
                                    ),
                                    SizedBox(height: 5,),
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: LikeButton()
                                      ),
                                    )
                                  ],
                                )
                            )
                        )
                    );
                  }),),
            ))
          ],
        ),
      ),
    );
  }
}