import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';

class Patrocinantes extends StatelessWidget {
  
  const Patrocinantes({Key key}) : super(key: key);

  static List<String> imgs=["Conicet.png","BioArtis.png","Immunology.png"];
  static List<String> urls=["https://www.conicet.gov.ar","https://www.bioartis.com.ar","http://www.immunology.com.ar"];
  static String directory="assets/images/patrocinantes/";
  
  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Functions.getTitle("Patrocinantes", ancho),
        backgroundColor: color3,
        leading: Functions.goBack(context),
      ),
      body: Container(
        decoration: Functions.getFondo(),
        padding: EdgeInsets.only(left:20.0,right:20.0,top:20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: Functions.getText("Presione en la imagen para navegar al sitio del patrocinante",ancho),
            ),
            Expanded(
              child: ListView(
                children: [
                  Functions.getSubtitle("Institución patrocinante",ancho,align: Alignment.center,bottomPadding: 0.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width:4)
                      ),
                      child:Semantics(
                        label: "Logo Conicet",
                        link: true,
                        child: GestureDetector(child: Image.asset(directory+imgs[0]),
                         onTap:(){Functions.goTo(urls[0], context);})
                      ),
                    ),
                  ),  
                  Functions.getSubtitle("Empresas patrocinantes",ancho,align: Alignment.center,bottomPadding: 0.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width:4)
                      ),
                      child:Semantics(
                        label: "Logo BioArtis",
                        link: true,
                        child: GestureDetector(
                          child: Image.asset(directory+imgs[1]),
                          onTap:(){Functions.goTo(urls[1], context);})
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width:4)
                      ),
                      child:Semantics(
                        label: "Logo Immunology",
                        link: true,
                        child: GestureDetector(
                          child: Image.asset(directory+imgs[2]),
                          onTap:(){Functions.goTo(urls[2], context);}
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ), 
          ],
        ),
      )
    );
  }
  
}