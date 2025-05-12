import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce/firebase_options.dart';
import 'package:flutter_ecomerce/pages/splash_page.dart';
import 'package:flutter_ecomerce/routes/routes.dart';
import 'package:flutter_ecomerce/screens/about_us.dart';
import 'package:flutter_ecomerce/screens/home_page.dart';
import 'package:flutter_ecomerce/screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.yellow,fontFamily: "Gothic"),
          bodySmall: TextStyle(color: Colors.yellow,fontFamily: "Gothic"),
          bodyLarge: TextStyle(color: Colors.yellow,fontFamily: "Gothic"),
          titleMedium: TextStyle(color: Colors.orange,fontFamily: "Gothic"),
          titleLarge: TextStyle(color: Colors.orange,fontFamily: "Gothic"),
          titleSmall: TextStyle(color: Colors.orange,fontFamily: "Gothic"),
        )
      ),
      routes: {
        PageRoutes.userHome : (context) => HomePage(),
        PageRoutes.userLogin : (context) => LoginPage(),
        PageRoutes.aboutUs:(context)=>AboutUsPage()
      },
    );
  }
}



