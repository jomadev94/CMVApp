import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:congreso_modelo_1/layout/breakpoints.dart';
import 'package:congreso_modelo_1/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Disertantes extends StatelessWidget {
  
  const Disertantes({Key key}) : super(key: key);

  void _sendEmail(String email, BuildContext context) async{

    String _url="mailto:"+email+"?subject=Congreso%20de%20Microbiologia%20Veterinaria";

    if(await canLaunch(_url)){
      await launch(_url);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Su dispositivo no cuenta con una app para enviar correos"),
        )
      );
    }

  }

  Widget _disertante(String nombre,String cargo,String correo,String urlImagen, BuildContext context,[double paddingBottom=20.0]){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(bottom:paddingBottom),
      child: Container(
        padding: EdgeInsets.symmetric(vertical:8.0),
        child: ListTile(
          leading: LayoutBuilder(
            builder: (context, constrains) {
              if(constrains.maxWidth<breakpointMobile){
                return _getIcon(urlImagen,iconSizeMobile);
              }
              return _getIcon(urlImagen,iconSizeTablet);
            }
          ),
          title: LayoutBuilder(
            builder: (context, constrains){
              if(constrains.maxWidth<breakpointMobile){
                return AutoSizeText(nombre,minFontSize:mobileFontText);
              }
              return AutoSizeText(nombre,minFontSize:tabletFontText);
            }
          ),
          trailing: Semantics(
            label: "Ver contacto",
            child: IconButton(
              icon: Icon(Icons.more_vert,color:Colors.lightBlue[900]), 
              onPressed: (){
                showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (BuildContext context)=> AlertDialog(
                    buttonPadding: EdgeInsets.all(6.0),
                    title:Text(nombre),
                    content: Text(cargo),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: TextButton.icon(onPressed:(){_sendEmail(correo,context);}, icon:Icon(Icons.email_outlined), label:Text("Enviar Correo")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: TextButton.icon(onPressed:(){Navigator.of(context).pop();}, icon:Icon(Icons.cancel_outlined), label:Text("Cerrar")),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      )
    );
  }

  SizedBox _getIcon(String urlImagen, double size) {
    return SizedBox(
      height: size,
      width: size,
      child: Center(
        child: CachedNetworkImage(
          placeholder: (context, url)=> CircularProgressIndicator(),
          imageUrl:"https://res.cloudinary.com/cmv-app/image/upload/"+urlImagen,
          fit: BoxFit.fill,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var ancho=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Functions.getTitle("Disertantes",ancho),
        backgroundColor: color2,
        leading:Functions.goBack(context)
      ),
      body: SafeArea(
        child: Container(
          decoration: Functions.getFondo(),
          padding: EdgeInsets.only(left:20.0,right:20.0,top:20.0),
          child: ListView(
            children: [
              _disertante("Abrantes Rub??n", "Departamento de Micolog??a, INEI, ANLIS 'Dr. C.G. Malbr??n'", "negroabra4@gmail.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Albarellos Gabriela", "Facultad de Ciencias Veterinarias, Universidad de Buenos Aires. Conicet", "gabrielaalbarellos@gmail.com","v1621103071/disertantes/CONICET.jpg",context),
              _disertante("Barcos Luis", "Representante de la OIE en las Am??ricas", "m.minassian@oie.int","v1621103071/disertantes/OIE.jpg",context),
              _disertante("Bratanich Ana", "Facultad de Ciencias Veterinarias, Universidad de Buenos Aires", "abratanich@yahoo.com.ar","v1621103072/disertantes/UBA.png",context),
              _disertante("Brihuega Bibiana", "Instituto de Investigaci??n en Patobiolog??a, INTA Castelar", "brihuega.bibiana@inta.gob.ar","v1621103071/disertantes/INTA.png",context),
              _disertante("Burgos Eliana", "Instituto Nacional de Medicina Tropical (INMeT), ANLIS 'Dr. C.G. Malbr??n'", "burgosef@gmail.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Carranza Alicia", "Facultad de Agronom??a y Veterinaria, Universidad Nacional de Rio Cuarto", "acarranza@ayv.unrc.edu.ar","v1621103072/disertantes/UNRC.jpg",context),
              _disertante("Casas Natalia", "Coordinaci??n de Zoonosis, Direcci??n de Control de Enfermedades Transmisibles, Ministerio de Salud de la Naci??n", "ncasasvet@gmail.com","v1621103071/disertantes/MINISTERIO_DE_SALUD.png",context),
              _disertante("Cisterna Daniel", "Departamento de Virolog??a, INEI, ANLIS ???Dr. C. G. Malbr??n???", "dancis99@yahoo.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Corso Alejandra", "Servicio de Antimicrobianos. INEI, ANLIS ???Dr. C. G Malbr??n???", "corsoalejandra@gmail.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("D??az Luis Adri??n", "Laboratorio de Arbovirus, IIBYT CONICET, Instituto de Virolog??a ???Dr. J.M. Vanella??? Universidad Nacional de C??rdoba", "ladriandiaz@gmail.com","v1621103072/disertantes/UNC.png",context),
              _disertante("Dolcini Guillermina", "CIVETAN. CIC Pcia Bs As-CONICET-Facultad de Ciencias Veterinarias, Universidad Nacional del Centro de la Provincia de Buenos Aires", "gdolcini@vet.unicen.edu.ar","v1621103071/disertantes/CONICET.jpg",context),
              _disertante("Errecalde Jorge", "Facultad de Ciencias Veterinarias, Universidad Nacional de La Plata", "jerrecal@yahoo.com","v1621103073/disertantes/UNLP.png",context),
              _disertante("Fern??ndez Jaramillo Heriberto", "Universidad Austral de Chile. Universidad San Sebasti??n, Sede Valdivia", "hfernandezjaramillo@gmail.com","v1621103072/disertantes/UNIVERSIDAD_SAN_SEBASTIAN.jpg",context),
              _disertante("Ferreira Gremi??o Isabella Dib", "Fundaci??n Oswaldo Cruz. Fiocruz. Brasil", "isabella.dib@ini.fiocruz.br","v1621103071/disertantes/FIOCRUZ.png",context),
              _disertante("Francisco Uzal", "School of Veterinary Medicine, University of California. EUA", "fauzal@ucdavis.edu","v1621103072/disertantes/UOC.jpg",context),
              _disertante("Fuentealba Nadia", "Facultad de Ciencias Veterinarias, Universidad Nacional de La Plata", "nadiafuentealba@hotmail.com","v1621103073/disertantes/UNLP.png",context),
              _disertante("Gagetti Paula", "Servicio de Antimicrobianos. INEI, ANLIS ???Dr. C. G Malbr??n???", "paulagagetti@gmail.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Galarce Nicol??s", "Facultad de Ciencias Veterinarias y Pecuarias. Universidad de Chile", "ngalarce@ug.uchile.cl","v1621103071/disertantes/FAVET.jpg",context),
              _disertante("Gisbert Mar??a Amelia", "Facultad de Ciencias Veterinarias, Universidad de Buenos Aires", "gisbertma@hotmail.com","v1621103072/disertantes/UBA.png",context),
              _disertante("G??mez Villafa??e Isabel", "Laboratorio de Ecolog??a de Poblaciones, EGE-IEGEBA (CONICET-Universidad de Buenos Aires)", "ielisagv@gmail.com","v1621103071/disertantes/CONICET.jpg",context),
              _disertante("Ibarra Camou Bel??n", "Instituto Nacional de Epidemiolog??a Mar del Plata", "bibarracamou@anlis.gob.ar","v1621103071/disertantes/MAR_DEL_PLATA_EPIDEMIOLOGIA.png",context),
              _disertante("Koval Ariel", "Biog??nesis Bag??", "ariel.koval@biogenesisbago.com","v1621103071/disertantes/BAG??.png",context),
              _disertante("Laborde Juan Martin", "Facultad de Ciencias Veterinarias, Universidad Nacional de La Plata", "juanmartinlaborde@gmail.com","v1621103073/disertantes/UNLP.png",context),
              _disertante("Lincopan Nilton", "Instituto de Ciencias Biom??dicas. Universidad de S??o Paulo, Brasil", "lincopan@usp.br","v1621103073/disertantes/USP.png",context),
              _disertante("Mar??a Bel??n Cevallos Almeida", "Facultad de Medicina Veterinaria y Zootecnia, Universidad Central del Ecuador", "mb_ceval@hotmail.com","v1621103072/disertantes/UCE.png",context),
              _disertante("Mart??nez Vivot Marcela", "Facultad de Ciencias Veterinarias, Universidad de Buenos Aires", "marcelavivot@hotmail.com","v1621103072/disertantes/UBA.png",context),
              _disertante("Maselli Rodrigues Demolin Daniele", "Centro Multidisciplinar para Investiga????o Biol??gica (CEMIB). Universidade Estadual de Campinas, Brasil", "danimaro@unicamp.br","v1621103072/disertantes/UNICAMP.png",context),
              _disertante("Monina Marta In??s", "Universidad Nacional de La Pampa ??? Actividad privada en el ??rea de equinos", "martamonina014@gmail.com","v1621103073/disertantes/UNLPAM.png",context),
              _disertante("Noseda Ram??n", "Laboratorio Azul Diagn??stico S.A", "rnoseda@laboratorioazul.com.ar","v1621103071/disertantes/LAB_AZUL.jpg",context),
              _disertante("Nusblat Leonora", "Unidad Operativa Centro de Contenci??n Biol??gica. INEI, ANLIS ???Dr. C. G. Malbr??n???", "lnusblat@anlis.gob.ar","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Plaza Pablo", "Laboratorio Ecotono. INIBIOMA, Universidad Nacional del Comahue", "plazapablo22@gmail.com","v1621103072/disertantes/UNCO.png",context),
              _disertante("Prieto M??nica", "Departamento de Microbiolog??a, INEI, ANLIS ???Dr. C. G. Malbr??n???", "mprieto@anlis.gob.ar","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Puebla Andrea", "Unidad de Gen??mica/Nodo Plataforma de Gen??mica. Instituto de Biotecnolog??a, INTA Castelar", "puebla.andrea@inta.gob.ar","v1621103071/disertantes/INTA.png",context),
              _disertante("Riera Laura", "Departamento de Control y Aseguramiento de Calidad, INEVH, ANLIS ???Dr. C. G. Malbr??n???", "lauramriera@yahoo.com.ar","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Rinaldi Osvaldo", "Colegio de Veterinarios de la Provincia de Buenos Aires, La Plata", "oaarinaldi@gmail.com","v1621103071/disertantes/COLEGIO_DE_VETERINARIOS.png",context),
              _disertante("Ruiz Lisandro", "Direcci??n de Productos veterinarios de SENASA", "lisandroemilio@gmail.com","v1621103072/disertantes/SENASA.jpg",context),
              _disertante("Rumi Valeria", "Facultad de Ciencias Veterinarias, Universidad de Buenos Aires", "valeriarumi@gmail.com","v1621103072/disertantes/UBA.png",context),
              _disertante("Samus Sergio", "Actividad privada LADIPREVET", "sergioasamus@gmail.com","v1621103071/disertantes/LADIPREVET.png",context),
              _disertante("Scarpa Miguel", "Facultad de Ciencias Veterinarias, Universidad de Buenos Aires", "mvscarpa@gmail.com","v1621103072/disertantes/UBA.png",context),
              _disertante("Scialfa Exequiel", "Divisi??n Zoonosis rurales, Medicina preventiva, Ministerio de Salud de la provincia de Buenos Aires", "escialfa@yahoo.com.ar","v1621103071/disertantes/MINISTERIO_DE_SALUD.png",context),
              _disertante("Serena Mar??a Soledad", "Facultad de Ciencias Veterinarias, Universidad Nacional de La Plata", "solserena2000@yahoo.com.ar","v1621103073/disertantes/UNLP.png",context),
              _disertante("Su??rez ??lvarez Roberto", "Departamento de Micolog??a, INEI, ANLIS ???Dr. C. G. Malbr??n???", "robertosuarez01@gmail.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Taverna Constanza", "Departamento de Micolog??a, INEI, ANLIS ???Dr. C. G. Malbr??n???", "constanzataverna@gmail.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Torres Carmen", "??rea Bioqu??mica y Biolog??a Molecular, Facultad de Ciencias y Tecnolog??a, Logro??o, Espa??a", "carmen.torres@unirioja.es","v1621103072/disertantes/UR.jpg",context),
              _disertante("Traver??a Gabriel", "Facultad de Ciencias Veterinarias, Universidad Nacional de La Plata", "traveria@fcv.unlp.edu.ar","v1621103073/disertantes/UNLP.png",context),
              _disertante("Viale Mariana", "Departamento de Micolog??a, INEI, ANLIS ???Dr. C. G. Malbr??n???", "viale.mariana.noelia@gmail.com","v1621103071/disertantes/MALBRAN.jpg",context),
              _disertante("Zielinski Gustavo", "Sanidad animal, INTA Marcos Ju??rez, C??rdoba", "zielinski.gustavo@coyspu.com.ar","v1621103071/disertantes/INTA.png",context),
              _disertante("Zumarraga Mart??n", "Instituto de Biotecnolog??a. INTA Castelar", "zumarraga.martin@inta.gob.ar","v1621103071/disertantes/INTA.png",context),
            ]
          )
        ),
      ),
    );
  }

}