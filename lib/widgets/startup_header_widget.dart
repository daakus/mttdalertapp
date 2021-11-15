import 'package:flutter/material.dart';
import 'package:mttdalertapp/themes/settings.dart';
import 'package:provider/provider.dart';

class StartupHeaderWidget extends StatelessWidget {

  var text = "";

  StartupHeaderWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: Provider.of<Settings>(context, listen: false).isDarkMode ?
              [Colors.black, Colors.black12] :
              [Colors.blue, Colors.blueAccent],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25) ,
              bottomRight: Radius.circular(250))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 30,
              left: 10,
              right: 200,
              child: Center(
                child: Text(
            text,
            style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
              )),
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/police.png'),
              radius: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
