import 'package:flutter/material.dart';
import 'package:mttdalertapp/themes/settings.dart';
import 'package:mttdalertapp/utilities/constants.dart';
import 'package:mttdalertapp/widgets/btn_widget.dart';
import 'package:mttdalertapp/widgets/password_textfield_widget.dart';
import 'package:mttdalertapp/widgets/startup_header_widget.dart';
import 'package:mttdalertapp/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({Key? key}) : super(key: key);

  @override
  _RegisterUserScreenState createState() => _RegisterUserScreenState();
}

final TextEditingController _emailController =  TextEditingController();
final TextEditingController _fullnameController =  TextEditingController();
final TextEditingController _phoneNumberController =  TextEditingController();
final TextEditingController _passwordController =  TextEditingController();
final TextEditingController _confirmPasswordController =  TextEditingController();

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(fit: StackFit.loose, children: [
            Column(
              children: [
                StartupHeaderWidget("Register Page"),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      TextFieldWidget( controller:_fullnameController ,
                          hint: "Fullname",
                          icon: Icons.person_add),

                      TextFieldWidget( controller:_emailController ,
                          hint: "Email Address",
                          icon: Icons.email),

                      TextFieldWidget( controller:_phoneNumberController ,
                          hint: "Phone Number",
                          icon: Icons.phone),

                      PasswordTextFieldWidget( controller:_passwordController ,
                          hint: "Password",
                          icon: Icons.lock),

                      PasswordTextFieldWidget( controller:_confirmPasswordController ,
                          hint: "Confirm Password",
                          icon: Icons.lock),

                      const SizedBox(height: 30,),

                      Container(padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ButtonWidget(btnText: "Register", onClick: (){},)),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Constants.LOGIN_SCREEN);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 30,bottom: 30),
                          alignment: Alignment.centerRight,
                          child:  Center(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Already a member ? ",
                                    style: TextStyle(color: Provider.of<Settings>(context, listen: false).isDarkMode ? Colors.white : Colors.black)),
                                const TextSpan(
                                    text: "Login",
                                    style: TextStyle(color: Colors.blue)),
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
