import 'package:flutter/material.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/exceptions/connection_failed.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/services/api/connector.dart'
    as Connector;
import 'package:tele_doctor/viewModels/services/local/shared_prefence_controller.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController oldPassword = TextEditingController();
  final SPController sp = SPController();
  bool newPasswordShow = true;
  bool confirmPasswordShow = true;
  bool oldPasswordShow = true;
  bool ok = true;
  bool oldPasswordValidate = true;
  bool confirmPasswordValidate = true;
  bool newPasswordValidate = true;

  void checkOldPassword(String text) {
    oldPasswordValidate = text == this.oldPassword.text;
  }

  void checkNewPasswords() {
    confirmPasswordValidate = newPassword.text == confirmPassword.text;
    newPasswordValidate = confirmPasswordValidate;
  }

  Future<bool> _oldPasswordMatches() async {
    EnterProperties ep;
    ep = await sp.fetch(ep);
    return ep.patient.password == oldPassword.text;
  }

  bool _fieldsEmpty() {
    return newPassword.text == "" || confirmPassword.text == "";
  }

  bool _match() {
    return newPassword.text == confirmPassword.text;
  }

  Map<String, dynamic> _makeJson() {
    return {
      "old_password": oldPassword.text,
      "new_password": newPassword.text,
      "new_password2": confirmPassword.text
    };
  }

  Future<PatientHandler> changePassword(PatientHandler ph) async {
    if (_match() && !_fieldsEmpty() && (await _oldPasswordMatches())) {
      EnterProperties ep;
      ep = await sp.fetch(ep);
      String token = ep.token;
      http.Response response =
          await Connector.changePassword(token, _makeJson());
      if (response.statusCode == 200) {
        ph.patient.password = newPassword.text;
        return ph;
      } else
        throw ConnectionFailed();
    }
    return null;
  }
}
