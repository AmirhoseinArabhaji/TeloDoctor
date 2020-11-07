import 'package:flutter/material.dart';

//Todo add text input type

class EditTextField extends StatelessWidget {
  final String title;
  final bool isNumber;
  final TextEditingController controller;

  const EditTextField(
      {Key key,
      @required this.title,
      @required this.isNumber,
      @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width - 120,
      height: height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        autofocus: true,
        obscureText: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: Color(0xFF059147), width: 1.7, style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: Color(0xFF46F296), width: 1.7, style: BorderStyle.solid),
          ),
          hintText: title,
        ),
      ),
    );
  }
}
