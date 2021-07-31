import 'package:flutter/material.dart';
import 'package:library_app/constants.dart';
import 'package:library_app/screens/home/pdfViewer.dart';

class Books extends StatelessWidget {
  Books({Key? key}) : super(key: key);

  List books = [
    ["C Programming", "https://www.unf.edu/~wkloster/2220/ppts/cprogramming_tutorial.pdf"],
    ["Learn Java", "https://www.cs.cmu.edu/afs/cs.cmu.edu/user/gchen/www/download/java/LearnJava.pdf"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(title: Text("Books"),),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewerFile(url: books[index][1])));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(books[index][0],
                  style: TextStyle(
                        color: Colors.green,fontSize: 15),),
                    ),
                ),
              ),
            );
          }
      ),
    );
  }
}
