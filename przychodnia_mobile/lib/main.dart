import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:przychodnia_mobile/appointments_page.dart';
import 'package:przychodnia_mobile/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'Przychodnia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        '/appointments': (BuildContext context) => AppointmentsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
