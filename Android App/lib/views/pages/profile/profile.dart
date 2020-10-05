import 'package:flutter/material.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/views/pages/profile/widgets/image_profile.dart';
import 'package:tele_doctor/views/pages/profile/widgets/information.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_name.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_raised_button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//Bellatrix Lestrange
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: 500,
          height: 800,
          color: kMainColor,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileImage(),
                  Column(
                    children: [
                      ProfileName(),
                      SizedBox(height: 8),
                      ProfileEditButton(),
                    ],
                  ),
                ],
              ),
              Information(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: Column(
              //     children: [
              //       ProfileButtonCard("Visits"),
              //       SizedBox(
              //         height: 21,
              //       ),
              //       ProfileButtonCard("My Doctors"),
              //       SizedBox(
              //         height: 21,
              //       ),
              //       ProfileButtonCard("Sickness Types"),
              //       SizedBox(
              //         height: 21,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}