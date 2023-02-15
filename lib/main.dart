// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gdsc/config/router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  
  await Hive.openBox(
    'passwords',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const kBackgroundColor = Color(0xFF202020);
    const kPrimaryColor = Color(0xFFFFBD73);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GDSC',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: const TextTheme(
          headline4:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          button: TextStyle(color: kPrimaryColor),
          headline5:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const LoginScreen(),
    );
  }
}
