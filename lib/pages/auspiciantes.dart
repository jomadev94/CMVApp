
import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:flutter/material.dart';
import '../widgets/common.dart';

class Auspiciantes extends StatelessWidget {
  
  const Auspiciantes({Key key}) : super(key: key);

  static List<String> imgs=["AACYTAL.png","AAFE.png","AAM.png","ANAV.png","AVA.png","CV.png","FAZ.png","SMV.png","UNCPBA.png","UNER.png","URC.png","UNL.png","UNNE.png","UNR.png","UNVM.png","URN.png"];
  static List<String> urls=["https://aacytal.org","http://safe-digital.org","https://www.aam.org.ar","http://anav.org.ar","https://www.aavld.org.ar","http://cvpba.org","https://www.faz.unt.edu.ar","https://www.someve.com.ar","http://www.vet.unicen.edu.ar","http://web.fb.uner.edu.ar/contenidos/339/medicina-veterinaria-presencial","http://www.ayv.unrc.edu.ar/index.php/es/","https://www.fcv.unl.edu.ar","http://www.vet.unne.edu.ar","https://fveter.unr.edu.ar","http://basicas.unvm.edu.ar","https://www.unrn.edu.ar/sedes/sede-alto-valle-y-valle-medio-3"];
  static String directory="assets/images/auspiciantes/";
  
  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Functions.getTitle("Auspiciantes", ancho),
        backgroundColor: color3,
        leading: Functions.goBack(context),
      ),
      body: Container(
        decoration: Functions.getFondo(),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Functions.getText("Presione en la imagen para navegar al sitio del auspiciante",ancho),
            Expanded(child: Semantics(
              slider: true,
              excludeSemantics: true,
              label: "Galeria logos de auspiciantes",
              child: Functions.getSwiperTap(directory,imgs,urls,context)
            )),
          ],
        ),
      )
    );
  }
  
}