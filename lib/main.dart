import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mttdalertapp/screens/startup/forgot_password_screen.dart';
import 'package:mttdalertapp/screens/startup/login_screen.dart';
import 'package:mttdalertapp/screens/startup/register_screen.dart';
import 'package:mttdalertapp/screens/startup/splash_screen.dart';
import 'package:mttdalertapp/themes/settings.dart';
import 'package:mttdalertapp/themes/themes.dart';
import 'package:mttdalertapp/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<Settings>.value(
          value: Settings(snapshot.data),
          child: _MyApp(),
        );
      },
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<Settings>(context).isDarkMode
            ? setDarkTheme
            : setLightTheme,
        home:  const SplashScreen(),
        routes: <String, WidgetBuilder>{
          Constants.SPLASH_SCREEN: (BuildContext context) =>  const SplashScreen(),
          Constants.LOGIN_SCREEN: (BuildContext context) =>  const LoginScreen(),
          Constants.REGISTER_SCREEN: (BuildContext context) =>  const RegisterUserScreen(),
          Constants.FORGOT_PASSWORD_SCREEN: (BuildContext context) => const ForgotPasswordScreen(),
        });
  }

}