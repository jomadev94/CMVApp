import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'dart:ui';

class Libro extends StatefulWidget {
  Libro({Key key}) : super(key: key);

  @override
  _LibroState createState() => _LibroState();
}

class _LibroState extends State<Libro> {

  String _urlBook="assets/book/CMV - Libro de resúmenes.pdf";
  bool _isLoading=true;
  PDFDocument _document;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => Timer(Duration(seconds:1), bookAlert));
    loadDocument();
  }

  loadDocument() async{
    _document=await PDFDocument.fromAsset(_urlBook);
    if(this.mounted){
      setState(() {
      _isLoading=false;
      });
    }
  }

  void bookAlert(){
    Functions.alert(
      content:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/gesto.gif",fit:BoxFit.scaleDown,cacheHeight:80,cacheWidth:80,height:160,width:160,), 
          Container(
            padding:EdgeInsets.only(top:20.0),
            child:AutoSizeText("Realice este gesto en la pantalla para expandir la imágen",minFontSize:15)
          )
        ]
      ),
      options: [TextButton(onPressed: (){ Navigator.of(context).pop();}, child: Text("Cerrar"))], 
      context:context
    );
  }

  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Functions.getTitle("Resúmenes", ancho),
        backgroundColor: color1,
        leading: Functions.goBack(context),
        actions: [
          Functions.drive(
            text: "El libro de resúmenes se encuentra almacenado en la nube. Desde este espacio podrá descargarlo.",
            url: "https://drive.google.com/drive/folders/1aNh31LFiL0KIZDbHsea041AUbFAL2if4?usp=sharing",
            context: context,
          )
        ],
      ),
      body: _isLoading? Center(child:CircularProgressIndicator()) : PDFViewer(
        document: _document,
        //indicatorBackground:color3,
        showIndicator: false,
        pickerButtonColor: fondoText,
        zoomSteps: 1,
        enableSwipeNavigation: false,
        tooltip: PDFViewerTooltip(pick:"Elegir una página:"),
        navigationBuilder:(context, page, totalPages, jumpToPage, animateToPage) {
          return Container(
            color: color3,
            child: ButtonBar(
              buttonPadding: EdgeInsets.all(6.0),
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.first_page,color:Colors.white),
                  onPressed: () {
                    jumpToPage(page: 0);
                  },
                ),
                IconButton(
                  padding: EdgeInsets.only(right:15.0),
                  icon: Icon(Icons.arrow_back, color:Colors.white),
                  onPressed: () {
                    animateToPage(page: page - 2);
                  },
                ),
                IconButton(
                  padding: EdgeInsets.only(left:15.0),
                  icon: Icon(Icons.arrow_forward, color:Colors.white),
                  onPressed: () {
                    animateToPage(page: page);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.last_page, color:Colors.white),
                  onPressed: () {
                    jumpToPage(page: totalPages - 1);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}