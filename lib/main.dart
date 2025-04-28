import 'package:flutter/material.dart';
import 'package:flutter_ecomerce/pages/splash_page.dart';
import 'package:flutter_ecomerce/routes/routes.dart';
import 'package:flutter_ecomerce/screens/home_page.dart';
import 'package:flutter_ecomerce/screens/login_page.dart';

void main(){
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecommerce App",
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[800],
      ),
      routes: {
        PageRoutes.userHome : (context) => HomePage(),
        PageRoutes.userLogin : (context) => LoginPage(),
      },
    );
  }
}



