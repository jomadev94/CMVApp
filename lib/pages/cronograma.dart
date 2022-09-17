import 'package:auto_size_text/auto_size_text.dart';
import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';

class Cronograma extends StatefulWidget {
  Cronograma({Key key}) : super(key: key);

  @override
  _CronogramaState createState() => _CronogramaState();
}

class _CronogramaState extends State<Cronograma> with TickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget _getTabBar(){
    return TabBar(controller: _tabController, 
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFF163772),
      ),
      unselectedLabelColor: Colors.black,
      indicatorPadding: EdgeInsets.symmetric(horizontal:5.0, vertical: 8.0),
      labelPadding: EdgeInsets.all(3.0),
      tabs: [
        Tab(text: "4 de Agosto",),
        Tab(text: "5 de Agosto"),
        Tab(text: "6 de Agosto"),
      ]
    );
  }

  Widget _getTabBarPages(double ancho) {
    return Container(
      decoration: Functions.getFondo(),
      padding: EdgeInsets.only(left:20.0,right: 20.0,top:20.0),
      child: TabBarView(controller: _tabController, children: <Widget>[
        _getDiaUno(ancho),
        _getDiaDos(ancho),
        _getDiaTres(ancho)
      ]),
    );
  }

  Widget _getDiaUno(double ancho){
    return ListView(
      children:[
        Padding(
          padding: const EdgeInsets.only(bottom:15.0),
          child: Functions.getText("Recuerde revisar los requisitos necesarios antes de ingresar a las salas.", ancho),
        ),
        _card("Conferencia plenaria de apertura",1,"9:00 AM", "Giacoboni Gabriela","1:1",[
          new Actividad("Luis Pasteur, un hombre que distinguió la esperanza biológica", "Noseda Ramón"),
          new Actividad("OIE y los desafíos para la sanidad animal mundial", "Barcos Luis")
        ]),
        _card("Mesa Redonda:\nCasos de difícil diagnóstico - Pequeños animales",1,"10:30 AM", "del Amo Alicia y Casas Luciano","1:2",[
          new Actividad("La importancia del diagnóstico confirmatorio en tuberculosis", "Martínez Vivot Marcela"),
          new Actividad("Rol del laboratorio para el diagnóstico de las enfermedades en canaricultura y ornitología", "Samus Sergio"),
          new Actividad("Caso clínico de coccidioidomicosis en un canino de Catamarca","Viale Mariana"),
        ]),
        _card("Mesa Redonda:\nCasos de difícil diagnóstico - Grandes animales",2,"10:30 AM", "López Ramón y Fiorentino María Andrea","1:3",[
          new Actividad("Disfagia faríngea por micosis de las bolsas guturales en un equino","Monina Marta Inés"),
          new Actividad("Salmonelosis multisistémica en lechones en recria I","Zielinski Gustavo"),
          new Actividad("Casos de difícil diagnóstico en bovinos y resueltos a partir de la intervención del Laboratorio de Microbiología","Travería Gabriel"),
        ]),
        _card("Mini-conferencia",1,"12:30 PM", "Mas Javier","1:4",[
          new Actividad("Co-ocurrencia de β-lactamasas clínicamente relevantes y genes que codifican MCR-1 en Escherichia coli en animales de compañía en Argentina", "Rumi Valeria")
        ]),
        _card("Simposio: Patógenos emergentes",1,"14:00 PM", "Pidone Claudio y Reynaldi Francisco","1:5",[
          new Actividad("Mucorales, los voraces de la Micología", "Abrantes Rubén"),
          new Actividad("Factores ecológicos y moleculares asociados a la emergencia de Arbovirus","Díaz Luis Adrián"),
          new Actividad("Arcobacterias", "Fernández Jaramillo Heriberto"),
        ]),
        _card("Simposio: Zoonosis",2,"14:00 PM", "Garbaccio Sergio y Monteavaro Cristina","1:6",[
          new Actividad("Ecología e interacción de roedores y orthohantavirus","Gómez Villafañe Isabel y Burgos Eliana"),
          new Actividad("Sporothrix, que sabemos del agente causal de una saprozoonosis en expansión","Ferreira Gremiao Isabella Dib"),
          new Actividad("Tuberculosis, nuevas herramientas para resolver un viejo problema","Zumarraga Martín"),
        ]),
        _card("Mesa Redonda:\nLa Microbiología en los animales de fauna silvestre",1,"17:00 PM", "Origlia Javier y Orozco Marcela","1:7",[
          new Actividad("Rol de los animales silvestres como reservorios de virus patógenos","Serena María Soledad"),
          new Actividad("¿Qué debemos saber sobre los animales silvestres vectores y reservorios de bacterias patógenas?","Plaza Pablo"),
          new Actividad("Importancia de los animales silvestres en la diseminación de las micosis","Suárez Álvarez Roberto"),
        ]),
        _card("Mesa Redonda:\nLa Microbiología en los animales de experimentación",2,"17:00 PM", "Carbone Cecilia y Carriquiriborde Martín","1:8",[
          new Actividad("Control sanitario en peces cebra utilizados en investigación científica","Laborde Juan Martín"),
          new Actividad("Nuevos desafíos en los programas de control sanitario de ratones","Maselli Rodrigues Demolin Daniele"),
          new Actividad("Experimentación animal para la evaluación de colonización y patogenicidad de Salmonella: modelo animal porcino e invertebrado","María Belén Cevallos Almeida"),
        ]),
      ]
    );
  }

  Widget _getDiaDos(double ancho){
    return ListView(
      children:[
        Padding(
          padding: const EdgeInsets.only(bottom:15.0),
          child: Functions.getText("Recuerde revisar los requisitos necesarios antes de ingresar a las salas.", ancho),
        ),
        _card("Simposio: Coronavirus\nRol de los animales en la cadena de transmisión",1,"9:00 AM", "Pecoraro Marcelo y Panei Javier","2:1",[
          new Actividad("Detección y caracterización molecular del SARS-CoV-2 en animales","Fuentealba Nadia"),
          new Actividad("Fauna silvestre como reservorio de coronavirus y su rol epidemiológico","Bratanich Ana"),
        ]),
        _card("Simposio: Resistencia microbiana",2,"9:00 AM", "Sanchez Bruni Sergio y Fiorentino Maria A.","2:2",[
          new Actividad("Estado actual de resistencia antimicrobiana en medicina veterinaria","Errecalde Jorge"),
          new Actividad("¿Qué hacemos los veterinarios como protagonistas de la resistencia antimicrobiana? Legislación","Ruiz Lisandro"),
          new Actividad("Normas de prescripción y venta de zooterápicos","Rinaldi Osvaldo"),
        ]),
        _card("Mini-conferencia: Rabia",1,"12:00 PM", "Galosi Cecilia y Sguazza Guillermo","2:3",[
          new Actividad("Caracterización molecular del virus de la rabia. Sus aplicaciones al diagnóstico y vigilancia epidemiológica en Argentina","Cisterna Daniel"),
          new Actividad("Situación epidemiológica de rabia en Argentina. Vigilancia y control","Casas Natalia"),
        ]),
        _card("Mesa Redonda:\nManejo terapéutico de las infecciones en pequeños animales",1,"15:00 PM", "Mas Javier y Córdoba Susana","2:4",[
          new Actividad("Nuevas opciones terapéuticas para el tratamiento de las virosis sistémicas","Gisbert María Amelia"),
          new Actividad("Antibióticos vs. Bacterias en veterinaria","Albarellos Gabriela"),
          new Actividad("Utilidad de los nuevos antifúngicos para el control de micosis","Scarpa Miguel"),
        ]),
        _card("Mesa Redonda:\nBioseguridad y Biocustodia",2,"15:00 PM", "Hevia Alejandra y Motter Andrea","2:5",[
          new Actividad("Manejo y custodia de virus patógenos","Riera Laura"),
          new Actividad("Importancia de la Bioseguridad y la Biocustodia en Bacteriología","Nusblat Leonora"),
          new Actividad("Implementación de medidas de bioseguridad y biocustodia en el laboratorio de Micología","Ibarra Camou Belén"),
        ]),
        _card("Conferencia",1,"17:30 PM", "Giacoboni Gabriela","2:6",[
          new Actividad("Resistencia a los antimicrobianos en ambiente y fauna silvestre. Mecanismos de resistencia y líneas genéticas emergentes e implicancias en salud humana","Torres Carmen"),
        ]),
      ]
    );
  }

  Widget _getDiaTres(double ancho){
   return ListView(
      children:[
        Padding(
          padding: const EdgeInsets.only(bottom:15.0),
          child: Functions.getText("Recuerde revisar los requisitos necesarios antes de ingresar a las salas.",ancho),
        ),
        _card("Mesa Redonda: Leptospiras",1,"9:00 AM", "Alvarado Pinedo Fiorella y Travería Gabriel","3:1",[
          new Actividad("Leptospirosis, metodologías diagnósticas. Rol de los animales silvestres","Brihuega Bibiana"),
          new Actividad("Leptospirosis bovina como zoonosis: importancia de la vacunación del ganado","Koval Ariel"),
          new Actividad("Epidemiología de la leptospirosis canina","Scialfa Exequiel"),
        ]),
        _card("Simposio: Nuevas herramientas aplicables al diagnóstico microbiológico",2,"9:00 AM", "Sguazza Guillermo y Tizzano Marco","3:2",[
          new Actividad("Identificación de hongos por proteómica. Utilidad del MALDI-TOF","Taverna Constanza"),
          new Actividad("Utilidad del MALDI-TOF para la rápida identificación de bacterias","Prieto Mónica"),
          new Actividad("Real time-PCR, una herramienta útil para detectar copias del virus de la Leucemia Bovina","Dolcini Guillermina"),
        ]),
        _card("Mini-conferencia",1,"12:00 PM", "Giacoboni Gabriela","3:3",[
          new Actividad("Staphylococcus resistentes a la meticilina en el marco de “Una Salud”: un viejo conocido en medicina humana vigente en la medicina veterinaria","Gagetti Paula"),
        ]),
        _card("Mesa Redonda:\nConstruyendo equipos para abordar la resistencia antimicrobiana en la interfaz humano-animal-ambiente",1,"14:00 PM", "Lazovski Jaime y Giacoboni Gabriela","3:4",[
          new Actividad("Vigilancia genómica de la resistencia bacteriana en “Una Salud”. Perspectivas y desafíos para Latino América","Lincopan Nilton"),
          new Actividad("Control de resistencia bacteriana a los antimicrobianos en pequeños animales en Chile: esfuerzos integrados bajo el concepto Una Salud","Galarce Nicolás"),
          new Actividad("Situación de la Resistencia a los antimicrobianos: ¿De dónde venimos? ¿dónde estamos? y ¿hacia dónde vamos?","Corso Alejandra"),
        ]),
        _card("Mesa Redonda: Anaerobios",2,"14:00 PM","Carloni Graciela y Moredo Fabiana","3:5",[
          new Actividad("Brachyspira","Carranza Alicia"),
          new Actividad("Diagnóstico microbiológico de las enfermedades clostridiales de los animales","Francisco Uzal"),
          new Actividad("Diagnóstico y vacunas de clostridios: pasado y presente","Koval Ariel"),
        ]),
        _card("Conferencia de cierre",1,"17:00 PM", "Córdoba Susana","3:6",[
          new Actividad("Aportes de la genómica en Medicina Veterinaria","Puebla Andrea"),
        ]),
      ]
    );
  }

  Widget _card(String title, int sala, String horario, String participa, String tag,List<Actividad> actividades){

    String nomSala;
    String urlSala;

    if(sala == 1){
      nomSala="Sala A";
      urlSala="https://unlp.webex.com/unlp/j.php?MTID=m56908fbd70f377cd8e4b4538e3dbbe65";
    }
    else{
      nomSala="Sala B";
      urlSala="https://unlp.webex.com/unlp/j.php?MTID=m72ab627d3c962ca40e11afb09d276ef5";
    }

    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Hero(
        tag: tag,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            excludeFromSemantics: true,
            splashColor: Colors.blue.withAlpha(30),
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(
              MaterialPageRoute(
                builder:(context){
                  return ActividadPage(horario:horario,nomSala:nomSala,tag:tag,title:title,participa:participa,urlSala:urlSala,actividades:actividades,);
                }
              ));
            },
            child: Column(
              children: [
                Functions.bannerActividad(nomSala, horario, false, urlSala, context),
                ListTile(
                  title: AutoSizeText(title,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),minFontSize:15.0,maxLines:2,overflow:TextOverflow.ellipsis),
                  trailing: Semantics(
                    label:"Mostrar mas detalles",
                    child: IconButton(
                      icon:Icon(Icons.keyboard_arrow_down, size: 30),
                      onPressed:(){Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:(context){
                            return ActividadPage(horario:horario,nomSala:nomSala,tag:tag,title:title,participa:participa,urlSala:urlSala,actividades:actividades);
                          }
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Functions.getTitle("Cronograma",ancho),
        backgroundColor: color1,
        leading: Functions.goBack(context),
        bottom: _getTabBar(),
      ),
      body: _getTabBarPages(ancho),
    );
  }

}

class ActividadPage extends StatefulWidget {

  final String tag;
  final String horario;
  final String nomSala;
  final String title;
  final String participa;
  final String urlSala;
  final List<Actividad> actividades;

  ActividadPage({Key key,this.tag,this.horario,this.nomSala,this.title,this.participa,this.urlSala,this.actividades}) : super(key: key);

  @override
  _ActividadPageState createState() => _ActividadPageState();

}

class _ActividadPageState extends State<ActividadPage> {

  List<Widget> getActividades(){
    List<Widget> resultado= [];
    for (var act in this.widget.actividades){
      resultado.add(
        ListTile(
          contentPadding: const EdgeInsets.only(left:15.0,bottom:8.0,right:15.0),
          horizontalTitleGap: 6.0,
          minLeadingWidth: 20.0,
          leading: Icon(Icons.circle,size:14.0,color:color3),
          title: AutoSizeText(act.descripcionAct+" - "+act.autorAct,style: TextStyle(color: Colors.black87),minFontSize:14.0),
        ),
      );
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: SafeArea(
        child: Hero(
          tag: this.widget.tag, 
          child: Card(
            margin: EdgeInsets.all(0.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Functions.bannerActividad(this.widget.nomSala,this.widget.horario,true, this.widget.urlSala, context),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(this.widget.title,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),minFontSize:18.0),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(0.0),
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left:15.0,bottom:8.0),
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText("Presentadores/Coordinadores:",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),minFontSize:16.0),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left:15.0,bottom:10.0),
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(this.widget.participa,style: TextStyle(color: Colors.black87),minFontSize:16.0),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left:15.0,bottom:8.0),
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText("Actividades:",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),minFontSize:16.0),
                        ),
                        Column(
                          children: getActividades(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}

class Actividad{

  String descripcion;
  String autor;

  Actividad(String descripcion,String autor){
    this.descripcion=descripcion;
    this.autor=autor;
  }

   get descripcionAct{
     return this.descripcion;
   }

   get autorAct{
     return this.autor;
   }

}

