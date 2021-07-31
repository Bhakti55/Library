import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewerFile extends StatefulWidget{
  PDFDocument? doc;
  final String url;

  PdfViewerFile({Key? key, required this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InvoiceClass();
  }
}

class InvoiceClass extends State<PdfViewerFile>{

  @override
  void initState() {
    _downloadPDFFile();
    super.initState();
  }

  void _downloadPDFFile() async {
    //PDFDocument d = await PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');

    PDFDocument d = await PDFDocument.fromURL(widget.url);

//    PDFDocument d = await PDFDocument.fromFile(await _getPDFFile(context, pdfurl));

    /* PdfController  d = PdfController(
      document: PdfDocument.openFile(pdfurl),
    );*/
    setState(() {
      widget.doc = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: widget.doc == null ? Text('Loading...') : PDFViewer(document: widget.doc!),
        )
    );
  }
}

