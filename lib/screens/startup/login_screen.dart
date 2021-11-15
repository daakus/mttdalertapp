import 'package:flutter/material.dart';
import 'package:mttdalertapp/screens/startup/forgot_password_screen.dart';
import 'package:mttdalertapp/themes/settings.dart';
import 'package:mttdalertapp/utilities/constants.dart';
import 'package:mttdalertapp/widgets/btn_widget.dart';
import 'package:mttdalertapp/widgets/password_textfield_widget.dart';
import 'package:mttdalertapp/widgets/startup_header_widget.dart';
import 'package:mttdalertapp/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final TextEditingController _emailController =  TextEditingController();
final TextEditingController _passwordController =  TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(fit: StackFit.loose, children: [
            Column(
              children: [
                StartupHeaderWidget("Login Page"),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      TextFieldWidget( controller:_emailController ,
                          hint: "Email Address",
                          icon: Icons.email),

                      PasswordTextFieldWidget( controller:_passwordController ,
                          hint: "Password",
                          icon: Icons.lock),

                      const SizedBox(height: 30,),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen()));
                        } ,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: "Forgot your Password?",
                                  style: TextStyle(color: Colors.blue)),
                            ]),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Container(padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ButtonWidget(btnText: "Login", onClick: (){},)),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Constants.REGISTER_SCREEN);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          alignment: Alignment.centerRight,
                          child: Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Don't have an account ? ",
                                      style: TextStyle(
                                          color: Provider.of<Settings>(context,
                                              listen: false)
                                              .isDarkMode
                                              ? Colors.white
                                              : Colors.black)),
                                  const TextSpan(
                                      text: "Register",
                                      style: TextStyle(color: Colors.blue)),
                                ]),
                              )),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
