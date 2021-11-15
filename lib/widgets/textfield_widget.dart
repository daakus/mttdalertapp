import 'package:flutter/material.dart';
import 'package:mttdalertapp/themes/settings.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {

 final controller;
  final hint;
  final icon;
  final type;


 const TextFieldWidget({Key? key, required this.controller, this.hint,this.icon,this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 10),
    child: TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(
            color: Provider.of<Settings>(context, listen: false).isDarkMode
                ? Colors.black
                : Colors.grey),
        prefixIcon: Icon(icon, color: Colors.black),
      ),
    ),
  );
  }
}
