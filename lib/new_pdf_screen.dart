import 'package:flutter/material.dart';
import 'package:pdfviewer2/pdfloadscreen.dart';


class NewPdfScreen extends StatelessWidget{
  const NewPdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(title: const Text("Next Page")),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: const PdfLoadScreen(name: '')
              )]
          ) 
     );
  }
}