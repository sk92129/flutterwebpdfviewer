import 'package:pdfx/pdfx.dart';
import 'package:flutter/material.dart';
    
class PdfLabPage extends StatefulWidget {
  final String name;

  const PdfLabPage({Key? key, required  this.name}) : super(key: key);

  @override
  State<PdfLabPage> createState() => _PdfLabPageState();
}
    
class _PdfLabPageState extends State<PdfLabPage> {

late PdfControllerPinch pdfController;

  @override
  void initState() {
    pdfController = PdfControllerPinch(document: PdfDocument.openAsset('assets/sample.pdf'));
    super.initState();
}
  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }


Widget pdfView() => PdfViewPinch(
  controller: pdfController ,
  onDocumentLoaded: (msg) {print(msg.toString());},
  onDocumentError: (error) { print(error.toString());}
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body:
      Center(
        child: pdfView(),
      ),
    );
  }
}
