import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';

class Requisitos extends StatelessWidget {
  
  const Requisitos({Key key}) : super(key: key);

  Column _showRequisitos(BuildContext context, double ancho) {
    var sizeImg=MediaQuery.of(context).size.width*0.40;
    return Column(
      children: [
        Functions.getSubtitle("Requisitos para el ingreso a las salas", ancho),
        Expanded(
          child: ListView(
            clipBehavior: Clip.antiAlias,
            children: [
              Functions.getText("La opción de 'Cronograma' que se encuentra en el menú principal, permite a los oyentes del congreso acceder de forma rápida a las salas. Sin embargo, antes de ingresar deberá cumplir con los siguientes requisitos:\n\n1) Contar con buena conexión a internet.\n\n2) Descargar la aplicación de Webex que se encuentra en la tienda de Google.\n\n3) Configurar la aplicación Webex con su nombre y correo (con el cual se inscribió).\n\nLe recomendamos revisar el instructivo de ingreso que recibio por correo para obtener una explicación más detallada.\n\nPuede descargar la aplicación de Webex, presionando la imagen que se encuentra debajo", ancho),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Semantics(
                    label: "Enlace de descarga de Webex",
                    link: true,
                    child:Image.asset("assets/images/logo/appWebex.png",fit: BoxFit.contain, width:sizeImg,height:sizeImg), 
                  ),
                  onTap:(){Functions.goTo("https://play.google.com/store/apps/details?id=com.cisco.webex.meetings&hl=es_AR&gl=US", context);},
                ),
              ),      
            ],
          ),
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Functions.getTitle("Requisitos",ancho),
        backgroundColor: color1,
        leading: Functions.goBack(context),
      ),
      body: Container(
        decoration: Functions.getFondo(),
        padding: EdgeInsets.only(left:20.0, right:20.0, top: 20),
        child: SafeArea(
          child: _showRequisitos(context, ancho),
        ),
      )
    );
  }
  
}
