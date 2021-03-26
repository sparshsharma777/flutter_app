import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Login.dart';
import 'package:flutter_app/utils/Routes.dart';
import 'package:flutter_app/wdgets/MyThemes.dart';
import 'pages/HomePage.dart';
import 'package:velocity_x/velocity_x.dart';



void main(){
  runApp(MyApp());
}


//day 16
class MyApp  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light, //for light theme
      theme:MyThemes.lightTheme(context),
      //themeMode: ThemeMode.dark,  // for day night theme
      debugShowCheckedModeBanner: false,
      darkTheme: MyThemes.darkTheme(context), //dark theme properties

      initialRoute: MyAppRoutes.homeRoute, //starting position of the application, app start from default route but land on "initialRoute"
      routes:{
        "/":(context)=> LoginPage(), //default route
        MyAppRoutes.homeRoute:(context)=> HomePage(),
        MyAppRoutes.homeDetailsRoute:(context)=> HomePage(),
        MyAppRoutes.loginRoute:(context)=> LoginPage()
      },
    );
  }

}









