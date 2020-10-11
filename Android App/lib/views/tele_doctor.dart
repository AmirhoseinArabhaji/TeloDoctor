import 'package:flutter/material.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/pages/profile/doctor_profile.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';
import 'package:tele_doctor/views/registerPages/sign_up/sign_up.dart';

class TeleDoctor extends StatefulWidget {
  @override
  _TeleDoctorState createState() => _TeleDoctorState();
}

class _TeleDoctorState extends State<TeleDoctor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        'signUp': (context) => SignUp(),
        'singIn': (context) => SignIn(),
        'mainPage': (context) => MainPage()
      },
    );
  }
}