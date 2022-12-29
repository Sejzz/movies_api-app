import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/pages/home.dart';
import 'package:movies_api/pages/login.dart';
import 'package:movies_api/pages/signup.dart';
import 'package:movies_api/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  //make sure that firebase is initialized before we run our application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,

     routes: {
      "/":(context) => login(),
      MyRoutes.loginroute:(context) => login(),
      MyRoutes.signuproute:(context) => signup(),
      MyRoutes.home:(context) => home(),
     },
      
    );
  }
}

