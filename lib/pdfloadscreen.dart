import 'dart:typed_data';

import 'package:pdfx/pdfx.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
    
class PdfLoadScreen extends StatefulWidget {
  final String name;

  const PdfLoadScreen({Key? key, required  this.name}) : super(key: key);

  @override
  State<PdfLoadScreen> createState() => _PdfLoadState();
}
    
class _PdfLoadState extends State<PdfLoadScreen> {

late PdfControllerPinch pdfController;
  late Future<Uint8List> pdfContent;

  Future<Uint8List> loadPdfFromUrl()  async {
    var url = "https://www.geo-blue.com/health_plan/geoblue_groupproductsbrochure.pdf";
    final file = await http.get(Uri.parse(url));
    final content = file.bodyBytes;
    return content;
  }

  @override
  void initState() {
    pdfContent = loadPdfFromUrl();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openData(pdfContent)
      );
    super.initState();
}
  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }


Widget pdfView() => PdfViewPinch(
  controller: pdfController ,
  onDocumentLoaded: (msg) {},
  onDocumentError: (error) { }
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Center(
        child: pdfView(),
      ),
    );
  }
}
