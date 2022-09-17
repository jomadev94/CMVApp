import 'package:congreso_modelo_1/pages/auspiciantes.dart';
import 'package:congreso_modelo_1/pages/cronograma.dart';
import 'package:congreso_modelo_1/pages/disertantes.dart';
import 'package:congreso_modelo_1/pages/info.dart';
import 'package:congreso_modelo_1/pages/libro.dart';
import 'package:congreso_modelo_1/pages/posters.dart';
import 'package:congreso_modelo_1/pages/requisitos.dart';
import 'package:congreso_modelo_1/pages/home.dart';
import 'package:congreso_modelo_1/pages/patrocinantes.dart';
import 'package:congreso_modelo_1/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMV App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      initialRoute: "/",
      routes:{
        "/":(context)=> SplashScreen(),
        "/home":(context)=> Home(),
        "/info":(context)=> Info(),
        "/cronograma":(context)=> Cronograma(),
        "/posters":(context)=> Posters(),
        "/libro":(context)=> Libro(),
        "/disertantes":(context)=> Disertantes(),
        "/requerimientos":(context)=> Requisitos(),
        "/auspiciantes":(context)=> Auspiciantes(),
        "/patrocinantes":(context)=> Patrocinantes(),
      }
    );
  }
}
