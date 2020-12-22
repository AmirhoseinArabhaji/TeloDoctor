import 'package:flutter/material.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/viewModels/controllers/change_password_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/change_password/change_password_textfield.dart';
import 'package:tele_doctor/views/pages/change_password/reset_password_button.dart';

class ChangePasswordLayout extends StatefulWidget {
  final PatientHandler _ph;

  ChangePasswordLayout(PatientHandler ph) : _ph = ph;

  @override
  _ChangePasswordLayoutState createState() => _ChangePasswordLayoutState(_ph);
}

class _ChangePasswordLayoutState extends State<ChangePasswordLayout> {
  final ChangePasswordController _controller = ChangePasswordController();
  PatientHandler ph;

  _ChangePasswordLayoutState(this.ph);

  void confirmPasswordFunction() {
    setState(() {
      _controller.confirmPasswordShow = !_controller.confirmPasswordShow;
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _controller.confirmPasswordShow = true;
        });
      });
    });
  }

  void newPasswordFunction() {
    setState(() {
      _controller.newPasswordShow = !_controller.newPasswordShow;
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _controller.newPasswordShow = true;
        });
      });
    });
  }

  void oldPasswordFunction() {
    setState(() {
      _controller.oldPasswordShow = !_controller.oldPasswordShow;
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _controller.oldPasswordShow = true;
        });
      });
    });
  }

  void check() {
    setState(() {
      if (this._controller.oldPassword.text != ph.patient.password)
        this._controller.oldPasswordValidate = false;
    });
  }

  void checkOldPasswordValidate() {
    setState(() {
      _controller.checkOldPassword(ph.patient.password);
    });
  }

  void checkPasswordConfirmation() {
    setState(() {
      _controller.checkNewPasswords();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        color: kMainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter Your New Password",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: height / 15,
            ),
            ChangePasswordTextField(
              onComplete: checkOldPasswordValidate,
              validate: this._controller.oldPasswordValidate,
              width: width,
              height: height,
              obscure: _controller.oldPasswordShow,
              onPressed: () => oldPasswordFunction(),
              labelText: AppLocalizations.of(context).translate("oldPassword"),
              controller: _controller.oldPassword,
            ),
            SizedBox(
              height: height / 20,
            ),
            ChangePasswordTextField(
              onComplete: () {},
              validate: _controller.newPasswordValidate,
              controller: _controller.newPassword,
              labelText: AppLocalizations.of(context).translate("newPassword"),
              height: height,
              width: width,
              onPressed: () => newPasswordFunction(),
              obscure: _controller.newPasswordShow,
            ),
            SizedBox(
              height: height / 20,
            ),
            ChangePasswordTextField(
              onComplete: checkPasswordConfirmation,
              validate: _controller.confirmPasswordValidate,
              controller: _controller.confirmPassword,
              labelText:
                  AppLocalizations.of(context).translate("confirmPassword"),
              height: height,
              width: width,
              onPressed: () => confirmPasswordFunction(),
              obscure: _controller.confirmPasswordShow,
            ),
            SizedBox(
              height: height / 12,
            ),
            ResetPassword(
              onPressed: () => _controller.changePassword(ph),
            ),
          ],
        ),
      ),
    );
  }
}
