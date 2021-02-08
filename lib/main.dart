import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:housing/Pages/Setup/signIn.dart';
import 'package:housing/Pages/Setup/welcome.dart';
import 'package:housing/getitlocator.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}