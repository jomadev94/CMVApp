import 'package:auto_size_text/auto_size_text.dart';
import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  _getPage(String route, BuildContext context) {
    Navigator.pushNamed(context, route);
  }

  Column _showOptions(double height,double itemHeight, double itemWidth,double max, double min) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height*0.6,
          width: double.infinity,
          child: Center(child: _options(itemHeight,itemWidth,max,min))
        ),
      ],
    );
  }

  Widget _options(double height,double width,double maxFont, double minFont){
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      childAspectRatio:(width*1.5/height*1.2),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 3,
      children: <Widget>[
        _option("Requisitos","/requerimientos",Icons.settings,context,color1,maxFont,minFont),
        _option("Información","/info",Icons.info,context,color1,maxFont,minFont),
        _option("Cronograma","/cronograma",Icons.calendar_today_sharp,context,color1,maxFont,minFont),
        _option("Disertantes","/disertantes",Icons.people_sharp,context,color2,maxFont,minFont),
        _option("Resúmenes","/libro",Icons.book,context,color2,maxFont,minFont),
        _option("Posters","/posters",Icons.file_copy_rounded,context,color2,maxFont,minFont),
        _option("Auspiciantes","/auspiciantes",Icons.apartment_outlined,context,color3,maxFont,minFont),
        _option("Patrocinantes","/patrocinantes",Icons.apartment_outlined,context,color3,maxFont,minFont),
      ],
    );
  }

  Widget _option(String nombre,String ruta, IconData icono, BuildContext context,Color color,double maxFont,double minFont){
    return Container(
      child: Semantics(
        label:nombre,
        button: true,
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          onPressed: (){_getPage(ruta, context);}, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex:3,child: Container(padding: EdgeInsets.symmetric(vertical:10.0),child: FittedBox(child: Icon(icono)))),
              Expanded(flex:1,child: Container(child: AutoSizeText(nombre,minFontSize:minFont,maxFontSize:maxFont,maxLines:1,overflow: TextOverflow.ellipsis)))
            ],
          )
        ),
      ),
    );
  }

  Widget _getOptions(Size size, double itemHeight, double itemWidth){
    if(size.width <  breakpointMobile){
      return _showOptions(size.height,itemHeight,itemWidth,maxFontMobileHome,minFontMobileHome);
    }
    else{
      return _showOptions(size.height,itemHeight,itemWidth,maxFontTabletHome,minFontTabletHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    final double itemHeight=size.height/3;
    final double itemWidth=size.width/3;
    return Semantics(
      label: "CMV App: Página de Inicio",
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal:10.0),
          decoration: Functions.getFondoHome(MediaQuery.of(context).size.width),
          child: SafeArea(
            child:_getOptions(size,itemHeight,itemWidth),
          ),
        ),
      ),
    );
  }

  
  
}
