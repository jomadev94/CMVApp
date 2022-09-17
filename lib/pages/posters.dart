import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';

class Posters extends StatefulWidget {
  
  Posters({Key key}) : super(key: key);

  @override
  _PostersState createState() => _PostersState();

}

class _PostersState extends State<Posters> {
  
  final ejes={
    0: new Eje("Eje RA","Resistencia a los antimicrobianos",[
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139150/posters/Resistencia%20a%20los%20antimicrobianos/RA_001.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624222039/posters/Resistencia%20a%20los%20antimicrobianos/RA_002.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624221599/posters/Resistencia%20a%20los%20antimicrobianos/RA_003.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139146/posters/Resistencia%20a%20los%20antimicrobianos/RA_004.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139146/posters/Resistencia%20a%20los%20antimicrobianos/RA_005.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139146/posters/Resistencia%20a%20los%20antimicrobianos/RA_006.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139146/posters/Resistencia%20a%20los%20antimicrobianos/RA_007.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139146/posters/Resistencia%20a%20los%20antimicrobianos/RA_008.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139146/posters/Resistencia%20a%20los%20antimicrobianos/RA_009.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139147/posters/Resistencia%20a%20los%20antimicrobianos/RA_010.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139147/posters/Resistencia%20a%20los%20antimicrobianos/RA_011.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139147/posters/Resistencia%20a%20los%20antimicrobianos/RA_012.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139148/posters/Resistencia%20a%20los%20antimicrobianos/RA_013.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139147/posters/Resistencia%20a%20los%20antimicrobianos/RA_014.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139148/posters/Resistencia%20a%20los%20antimicrobianos/RA_015.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624139148/posters/Resistencia%20a%20los%20antimicrobianos/RA_016.png",
    ]),
    1: new Eje("Eje DIAG","Diagnóstico microbiológico",[
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138925/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_001.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138924/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_002.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138925/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_003.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624223142/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_004.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138925/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_005.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138925/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_006.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138925/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_007.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624223226/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_008.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138925/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_009.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138925/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_010.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138926/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_011.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138926/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_012.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138926/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_013.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138930/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_014.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138926/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_015.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138927/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_016.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138926/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_017.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138926/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_018.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138927/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_019.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138927/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_020.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138927/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_021.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138928/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_022.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138928/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_023.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138927/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_024.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138928/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_025.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138928/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_026.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624138928/posters/Diagn%C3%B3stico%20microbiol%C3%B3gico/DIAG_027.png",
    ]),
    2: new Eje("Eje MIC","Micología",[
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140996/posters/Micolog%C3%ADa/MIC_001.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140997/posters/Micolog%C3%ADa/MIC_002.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140998/posters/Micolog%C3%ADa/MIC_003.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140998/posters/Micolog%C3%ADa/MIC_004.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140998/posters/Micolog%C3%ADa/MIC_005.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140999/posters/Micolog%C3%ADa/MIC_006.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140998/posters/Micolog%C3%ADa/MIC_007.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624140998/posters/Micolog%C3%ADa/MIC_008.png",
    ]),
    3: new Eje("Eje BAC","Bacteriología",[
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141280/posters/Bacteriolog%C3%ADa/BAC_001.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141280/posters/Bacteriolog%C3%ADa/BAC_002.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141280/posters/Bacteriolog%C3%ADa/BAC_003.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141280/posters/Bacteriolog%C3%ADa/BAC_004.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141280/posters/Bacteriolog%C3%ADa/BAC_005.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141280/posters/Bacteriolog%C3%ADa/BAC_006.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624225244/posters/Bacteriolog%C3%ADa/BAC_007.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141281/posters/Bacteriolog%C3%ADa/BAC_008.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141281/posters/Bacteriolog%C3%ADa/BAC_009.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141281/posters/Bacteriolog%C3%ADa/BAC_010.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141281/posters/Bacteriolog%C3%ADa/BAC_011.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624201811/posters/Bacteriolog%C3%ADa/BAC_012.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141282/posters/Bacteriolog%C3%ADa/BAC_013.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141282/posters/Bacteriolog%C3%ADa/BAC_014.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624224019/posters/Bacteriolog%C3%ADa/BAC_015.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141282/posters/Bacteriolog%C3%ADa/BAC_016.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141282/posters/Bacteriolog%C3%ADa/BAC_017.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141282/posters/Bacteriolog%C3%ADa/BAC_018.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624225286/posters/Bacteriolog%C3%ADa/BAC_019.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141282/posters/Bacteriolog%C3%ADa/BAC_020.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1626531276/posters/Bacteriolog%C3%ADa/BAC_021.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141283/posters/Bacteriolog%C3%ADa/BAC_022.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141283/posters/Bacteriolog%C3%ADa/BAC_023.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141283/posters/Bacteriolog%C3%ADa/BAC_024.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141283/posters/Bacteriolog%C3%ADa/BAC_025.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141283/posters/Bacteriolog%C3%ADa/BAC_026.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141283/posters/Bacteriolog%C3%ADa/BAC_027.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141284/posters/Bacteriolog%C3%ADa/BAC_028.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141284/posters/Bacteriolog%C3%ADa/BAC_029.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141284/posters/Bacteriolog%C3%ADa/BAC_030.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141284/posters/Bacteriolog%C3%ADa/BAC_031.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141285/posters/Bacteriolog%C3%ADa/BAC_032.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141284/posters/Bacteriolog%C3%ADa/BAC_033.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141285/posters/Bacteriolog%C3%ADa/BAC_034.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141285/posters/Bacteriolog%C3%ADa/BAC_035.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141285/posters/Bacteriolog%C3%ADa/BAC_036.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141285/posters/Bacteriolog%C3%ADa/BAC_037.png",
    ]),
    4: new Eje("Eje VIR","Virología",[
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141090/posters/Virolog%C3%ADa/VIR_001.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141090/posters/Virolog%C3%ADa/VIR_002.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141090/posters/Virolog%C3%ADa/VIR_003.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624225611/posters/Virolog%C3%ADa/VIR_004.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624225646/posters/Virolog%C3%ADa/VIR_005.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141090/posters/Virolog%C3%ADa/VIR_006.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141091/posters/Virolog%C3%ADa/VIR_007.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141091/posters/Virolog%C3%ADa/VIR_008.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141091/posters/Virolog%C3%ADa/VIR_009.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141092/posters/Virolog%C3%ADa/VIR_010.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141091/posters/Virolog%C3%ADa/VIR_011.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141092/posters/Virolog%C3%ADa/VIR_012.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141092/posters/Virolog%C3%ADa/VIR_013.png",
      "https://res.cloudinary.com/cmv-app/image/upload/v1624141092/posters/Virolog%C3%ADa/VIR_014.png",
    ]),
  };

  Scaffold _getGaleria(int numero, double ancho){
    return Scaffold(
      appBar:AppBar(
        title: Functions.getTitle(ejes[numero].numeroEje, ancho),
        backgroundColor: Color(0xFF009FDD),
        leading:Functions.goBack(context)
      ),
      body:Semantics(
        label: "Galeria del eje",
        child: Container(
          decoration: Functions.getFondo(),
          child: ExcludeSemantics(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0, 
              ),
              itemBuilder: (context,index){
                return GestureDetector(
                  child: Hero(
                    tag:numero.toString()+index.toString(),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation:7,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: BorderSide(width:1.8,color:fondoText)),
                      margin: EdgeInsets.all(0.0),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CachedNetworkImage(
                          imageUrl: ejes[numero].galeriaEje[index],
                          fit: BoxFit.cover,
                          placeholder:(context,url)=> Center(child: CircularProgressIndicator(valueColor:new AlwaysStoppedAnimation<Color>(color2))),
                          errorWidget:(context,url,error)=>Icon(Icons.error_outline_outlined),
                          memCacheHeight: 250,
                          memCacheWidth:200
                        ),
                      ),
                    )
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                    builder:(context){
                      return PosterPage(urlPoster:ejes[numero].galeriaEje[index],tag:numero.toString()+index.toString());
                    }));
                  },
                );
              },
              itemCount:ejes[numero].galeria.length,
              padding: EdgeInsets.all(20.0),
            ),
          ),
        ),
      )
    );
  }

  List<TextSpan> _getTitleEje(String numero, String nombre, double ancho){
    if(ancho < breakpointMobile){
      return [
        TextSpan(text:numero+": ", style: TextStyle(fontWeight:FontWeight.bold,fontSize:mobileFontText)),
        TextSpan(text:nombre,style: TextStyle(fontSize:mobileFontText)),
      ];
    }
    return [
      TextSpan(text:numero+": ", style: TextStyle(fontWeight:FontWeight.bold,fontSize:tabletFontText)),
      TextSpan(text:nombre,style: TextStyle(fontSize:tabletFontText)),
    ];
  }

  Widget _getEje(int numero, BuildContext context, double ancho){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(bottom:20.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical:3.0),
        child: ListTile(
          title: RichText(
            text: TextSpan(
              style: TextStyle(color:Colors.black),
              children: _getTitleEje(ejes[numero].numeroEje,ejes[numero].nombreEje, ancho),
            ),
          ),
          trailing: Semantics(
            label: "Mostrar posters del eje",
            child: IconButton(
              icon: Icon(Icons.folder,color:Colors.lightBlue[900]), 
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder:(context){
                    return _getGaleria(numero,ancho);
                  })
                );
              },
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        title: Functions.getTitle("Posters",ancho),
        backgroundColor: color2,
        leading: Functions.goBack(context),
        actions: [
          Functions.drive(
            text: "Todos los posters del congreso se encuentran almacenados en la nube. Desde este espacio, tendra la posibilidad de descargarlos.",
            url: "https://drive.google.com/drive/folders/1hbVzLav7RpRPMsJQzllHgj3swcULVwif?usp=sharing",
            context: context,
          )
        ],
      ),
      body:Container(
        padding: EdgeInsets.only(left:20.0,right:20.0,top:20.0),
        decoration: Functions.getFondo(),
        child: ListView(
          children: [
            _getEje(0,context,ancho),
            _getEje(1,context,ancho),
            _getEje(2,context,ancho),
            _getEje(3,context,ancho),
            _getEje(4,context,ancho),
          ],
        )
      )
    );
  }

}

class PosterPage extends StatefulWidget {

  final String urlPoster;
  final String tag;

  PosterPage({Key key, this.urlPoster, this.tag}) : super(key: key);

  @override
  _PosterPageState createState() => _PosterPageState();

}

class _PosterPageState extends State<PosterPage> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation:0, leading: Functions.goBack(context)),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: Functions.getFondo(),
        child: SafeArea(
          child:Center(
            child: InteractiveViewer(child: Hero(tag:this.widget.tag,child: CachedNetworkImage(imageUrl: this.widget.urlPoster,fit: BoxFit.contain,width: double.infinity,placeholder:(context,url)=> Center(child: CircularProgressIndicator(valueColor:new AlwaysStoppedAnimation<Color>(Colors.white))))))
          )
        )
      ),
    );
  }

}

class Eje{

  String numero;
  String nombre;
  List<String> galeria;

  Eje(String numero,String nombre,List<String> galleria){
    this.numero=numero;
    this.nombre=nombre;
    this.galeria=galleria;
  }

  get numeroEje{
    return this.numero;
  }

  get nombreEje{
    return this.nombre;
  }

  get galeriaEje{
    return this.galeria;
  }

}