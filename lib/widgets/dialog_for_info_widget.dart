import 'package:flutter/material.dart';

class InformationDialog extends StatefulWidget {
  final String title, descriptions, btnText;

  @override
  _InformationDialogState createState() => _InformationDialogState();

   const InformationDialog(
      {Key? key, required this.title,
      required this.descriptions,
      required this.btnText}) : super(key: key);
}

 const double padding =15;
 const double avatarRadius =45;



class _InformationDialogState extends State<InformationDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      padding: const EdgeInsets.all(20),
      child: contentBox(context),
    );
  }

  Widget contentBox(context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
            padding: const EdgeInsets.only(
                left: padding,
                top: 10,
                right: padding,
                bottom: padding),
            margin: const EdgeInsets.only(top: avatarRadius),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(padding),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, offset: Offset(0, 1), blurRadius: 1),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height:40,
                  child:  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),

                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: 100, minWidth: double.infinity, maxHeight: MediaQuery.of(context).size.height - 225),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          widget.descriptions,
                          style: const TextStyle(fontSize: 16,color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 40,
                  child:   Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text(
                            widget.btnText,
                            style: const TextStyle(fontSize: 18),
                          )),
                    ),
                  ),
                )
                // ...
              ],
            ),
          ),
    );

  }
}
