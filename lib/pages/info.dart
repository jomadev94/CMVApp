import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../widgets/common.dart';

class Info extends StatelessWidget {

  const Info({Key key}) : super(key: key);

  Widget _swiperContent(BuildContext context) {

    List<String> imgs=["info-1.jpg", "info-2.jpg","info-3.jpg","info-4.jpg"];

    return AspectRatio(
      aspectRatio: 3/2,
      child: Container(
        padding: EdgeInsets.only(bottom:20.0),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Hero(
              tag: imgs[index],
              child: Image.asset("assets/images/info/"+imgs[index],fit: BoxFit.cover,cacheHeight:400,cacheWidth:400,)
            );
          },
          onTap: (int index){
            Navigator.of(context).push(MaterialPageRoute(
              builder:(context){
                return _photoPage("assets/images/info/"+imgs[index], imgs[index]);
              }
            ));
          },
          itemCount: imgs.length,
          pagination: SwiperPagination(margin: EdgeInsets.all(12.0)),
          control: SwiperControl(size: 0.0),
          viewportFraction: 0.8,
          scale: 0.9,
          layout: SwiperLayout.DEFAULT,
        )
      ),
    );

  }

  Scaffold _photoPage(String urlImage, String tag) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation:0),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: Functions.getFondo(),
        child: SafeArea(
          child:Center(
            child: InteractiveViewer(child: Hero(tag:tag,child: Image.asset(urlImage,fit: BoxFit.fitWidth,height:double.infinity)))
          )
        )
      ),
    );
  }

  Column _showInfo(BuildContext context, double ancho) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Functions.getSubtitle("Acerca del congreso",ancho),
        Expanded(
          child: ListView(
            children:[
              Semantics(
                slider: true,
                hidden: true,
                excludeSemantics: true,
                label: "Galeria con fotos de la Facultad de Ciencias Veterinarias UNLP",
                child: _swiperContent(context),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: Functions.getText('La Microbiología estudia el desarrollo de los microorganismos y las alteraciones que provocan en el ser humano, animales, vegetales y  naturaleza inanimada. Estos conocimientos se traducen en el entendimiento de muchas de las condiciones que rigen la vida.\n\nEl  objetivo principal de esta reunión científica será abordar diferentes problemáticas de la medicina veterinaria ocasionadas por microorganismos, difundiendo a través de las actividades programadas, las investigaciones y últimos avances científicos en el área, de una manera multidisciplinaria y federal.',ancho),
              ),
            ]
          ),
        ) 
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Functions.getTitle("Información",ancho),
        backgroundColor: color1,
        leading: Functions.goBack(context),
      ),
      body: Container(
        decoration: Functions.getFondo(),
        padding: EdgeInsets.only(left:20.0,right:20.0,top: 20.0),
        child: SafeArea(
          child: _showInfo(context, ancho),
        )
      ),
    );
  }

}
 
