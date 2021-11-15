import 'package:flutter/material.dart';
import 'package:mttdalertapp/themes/settings.dart';
import 'package:mttdalertapp/utilities/constants.dart';
import 'package:mttdalertapp/widgets/btn_widget.dart';
import 'package:mttdalertapp/widgets/startup_header_widget.dart';
import 'package:mttdalertapp/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

final TextEditingController _emailController =  TextEditingController();

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(fit: StackFit.loose, children: [
            Column(
              children: [
                StartupHeaderWidget("Forgot Password Page"),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      TextFieldWidget( controller:_emailController ,
                          hint: "Email Address",
                          icon: Icons.email),

                      const SizedBox(height: 30,),

                      Container(padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ButtonWidget(btnText: "Send", onClick: (){},)),

                      GestureDetector(
                        onTap : () {
                          Navigator.pushReplacementNamed(
                              context, Constants.LOGIN_SCREEN);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 30),
                          alignment: Alignment.centerRight,
                          child: Center(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Go Back To ",
                                    style: TextStyle(
                                        color: Provider.of<Settings>(context, listen: false)
                                            .isDarkMode
                                            ? Colors.white
                                            : Colors.black)),
                                const TextSpan(
                                    text: "Login",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                    text: " Page ",
                                    style: TextStyle(
                                        color: Provider.of<Settings>(context, listen: false)
                                            .isDarkMode
                                            ? Colors.white
                                            : Colors.black)),
                              ]),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
