import 'package:flutter/material.dart';
import 'package:pdfviewer2/pdfpage.dart';

import 'new_pdf_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp( {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'hello'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MyHomePage> {


  void clear() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          
          title: const Text("Flutter  Example"),
          backgroundColor: const Color.fromARGB(255, 50, 156, 82),
          elevation: 6,
          actions: [
            PopupMenuButton(onSelected: (value) {
              // your logic
              setState(() {
                
              });
              if (value == '/openwindow'){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return NewPdfScreen();
                }));
              }
            //Navigator.pushNamed(context, value.toString());
            }, itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  value: '/openurl',
                  child: Text("Open Url for PDF"),
                ),
                PopupMenuItem(
                  value: '/openwindow',
                  child: Text("Open Window"),
                )
              ];
            })
          ],
        ),
       body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: const PdfLabPage(name: '')
            )]
       )

    );
  }

}
