import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Functions{
  
  static BoxDecoration getFondo(){
    return BoxDecoration(
      image:DecorationImage(
        image: AssetImage("assets/images/fondo-solo.png"),
        fit: BoxFit.cover,
      )
    );
  }

  static BoxDecoration getFondoHome(double width){
    if(width<breakpointMobile){
      return BoxDecoration(
        image:DecorationImage(
          image: AssetImage("assets/images/pantalla-home.png"),
          fit: BoxFit.fill,
        )
      );
    }
    else{
      return BoxDecoration(
        image:DecorationImage(
          image: AssetImage("assets/images/pantalla-home-tablet.png"),
          fit: BoxFit.fill,
        )
      );
    }
  }

  static BoxDecoration getFondoSplash(double width){
    if(width<breakpointMobile){
      return BoxDecoration(
        image:DecorationImage(
          image: AssetImage("assets/images/pantalla-inicio.png"),
          fit: BoxFit.fill,
        )
      );
    }
    else{
      return BoxDecoration(
        image:DecorationImage(
          image: AssetImage("assets/images/pantalla-inicio-tablet.png"),
          fit: BoxFit.fill,
        )
      );
    }
  }

  
  static Widget getTitle(String title, double width){
    if(width<breakpointMobile){
      return Text(title,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: mobileFontTitle));
    }
    return Text(title,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: tabletFontTitle));
  }
  
  static Widget getSubtitle(String subtitle,double width,{double bottomPadding=20.0, Color color=Colors.white, Alignment align=Alignment.centerLeft}){
    if(width < breakpointMobile){
      return Container(
        alignment: align,
        padding: EdgeInsets.only(bottom:bottomPadding),
        child: Text(subtitle,style: TextStyle(fontWeight:FontWeight.bold,color:color, fontSize: mobileFontSubtitle))
      );
    }
    return Container(
      alignment: align,
      padding: EdgeInsets.only(bottom:bottomPadding),
      child: Text(subtitle,style: TextStyle(fontWeight:FontWeight.bold,color:color, fontSize: tabletFontSubtitle))
    );
  }

  static Widget getText(String text,double width,{Color color=Colors.white}){
    if(width < breakpointMobile){
      return Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: fondoText,
        ),
        child: Text(text,style: TextStyle(color: color,fontSize:mobileFontText)),
      );
    }
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: fondoText,
      ),
      child: Text(text,style: TextStyle(color: color,fontSize:tabletFontText)),
    );
  }

  static void goTo(String url, BuildContext context) async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No se puede acceder al sitio"),
        )
      );
    }
  }

  static Widget goBack(BuildContext context){
    return Semantics(
      label: "Volver a la pagina anterior",
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){Navigator.of(context).pop();}
      ),
    );
  }
  
  static Widget getSwiperTap(String directory, List<String> images, List<String> urls, BuildContext context) {
    return AspectRatio(
      aspectRatio: 16/9,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:20.0),
        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width:4)
              ),
              child: Image(
                image: AssetImage(directory+images[index]),
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: images.length,
          pagination: SwiperPagination(builder: SwiperPagination.rect),
          control: SwiperControl(size: 0.0),
          viewportFraction: 0.7,
          scale: 0.8,
          layout: SwiperLayout.DEFAULT,
          scrollDirection: Axis.vertical,
          autoplay: true,
          onTap: (int index){
            goTo(urls[index], context);
          },
        ),
      ),
    );
  }

  static alert({Widget content,List<Widget> options,BuildContext context}){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context)=> AlertDialog(
        contentPadding: EdgeInsets.only(top:20.0,bottom:8.0,left:20.0,right:20.0),
        content:content,
        actions:options,
      ),
    );
  }

  static Widget drive({String text,String url, BuildContext context}){
    return Semantics(
      label: "Ir al respositorio",
      child: IconButton(
        icon: Icon(Icons.folder_shared_rounded),
        onPressed:(){
          Functions.alert(
            content: Text(text),
            options: [
              TextButton(onPressed: (){Functions.goTo(url, context);}, child:Text("Abrir con mi navegador")),
              TextButton(onPressed: (){Navigator.pop(context);}, child:Text("Cancelar")),
            ],
            context: context
          );
        }),
    );
  }

  static Widget closeActividad(bool cancel, BuildContext context){
    if(cancel){
      return Positioned(
        top: 0.0,
        right: 0.0,
        child: FittedBox(
          fit:BoxFit.scaleDown,
          child: Semantics(
            label: "Volver al cronograma",
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.close), 
              onPressed: (){Navigator.of(context).pop();}
            ),
          ),
        )
      );
    }
    return Container();
  }

  static Widget logoActividad(bool cancel, BuildContext context){
    if(cancel){
      return Positioned(
        top: 12.0,
        right: 40.0,
        child: Container(
          height: 60.0,
          width: 50.0,
          child: Image.asset("assets/images/logo/logo-actividad.png",cacheHeight:120,cacheWidth:200,fit:BoxFit.fill)
        )
      );
    }
    return Positioned(
      top: 12.0,
      right: 18.0,
      child: Container(
        height: 60.0,
        width: 50.0,
        child: Image.asset("assets/images/logo/logo-actividad.png",cacheHeight:120,cacheWidth:200,fit:BoxFit.fill)
      )
    );
  }

  static Widget bannerActividad(String nomSala, String horario, bool cancel, String urlSala,BuildContext context){
    return SizedBox(
      height: 210,
      child: Stack(
        children:[
          Positioned.fill(
            child: Image.asset("assets/images/fondo-actividad.png",fit:BoxFit.fill)
          ),
          Positioned(
            top: 10.0,
            left: 15.0,
            child: FittedBox(
              fit:BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(horario,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),minFontSize: 30.0),
                  AutoSizeText("Hora Arg. - Bs. As.",style: TextStyle(fontStyle: FontStyle.italic ,color: Colors.white), minFontSize: 15.0),
                  AutoSizeText(nomSala,style: TextStyle(fontStyle: FontStyle.italic ,color: Colors.white), minFontSize: 15.0)
                ],
              ),
            )
          ),
          logoActividad(cancel, context),
          closeActividad(cancel, context),
          Positioned(
            bottom: 10.0,
            right: 15.0,
            child: FittedBox(
              fit:BoxFit.scaleDown,
              child:ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF163772))),
                child:AutoSizeText("Ingresar", minFontSize: 10.0),
                onPressed: (){Functions.goTo(urlSala, context);}
              ),
            ),
          ),
          Positioned(
            bottom: -5.0,
            left: 5.0,
            child:Icon(Icons.videocam_outlined,size:90.0,color:Colors.white,)
          )
        ],
      ),
    );
  }

} 


