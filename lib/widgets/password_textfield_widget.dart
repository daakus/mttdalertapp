import 'package:flutter/material.dart';
import 'package:mttdalertapp/themes/settings.dart';
import 'package:provider/provider.dart';

class PasswordTextFieldWidget extends StatefulWidget {

  final controller;
  final hint;
  final icon;
  final type;


 const PasswordTextFieldWidget({Key? key, required this.controller, this.hint,this.icon,this.type}) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {

    void _togglePasswordView() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        obscureText: _isHidden,
        obscuringCharacter: "*",
        style: const TextStyle(color: Colors.black),
        controller: widget.controller,
        keyboardType: widget.type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: Provider.of<Settings>(context, listen: false).isDarkMode
                  ? Colors.black
                  : Colors.grey),
          prefixIcon: Icon(widget.icon, color: Colors.black),
          suffix: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15.0, 0),
            child: InkWell(
              onTap: _togglePasswordView,
              child: const Icon(
                Icons.visibility,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
