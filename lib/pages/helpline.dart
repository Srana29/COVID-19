// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpline extends StatefulWidget {
  const Helpline({Key key}) : super(key: key);

  @override
  _HelplineState createState() => _HelplineState();
}
void _launchCaller(String phone1) async {
  var url = "tel:${phone1.toString()}";
  if (await canLaunch(url)) {
    await launch(url);
  }
  else {
    throw 'An Error Occurred!';
  }
}

void _launchWhatsApp({@required phone,@required message}) async{
  String url = "whatsapp://send?phone=$phone&text=$message";
  if (await canLaunch(url)) {
    await launch(url);
  }
  else {
    throw 'An Error Occurred!';
  }
}

void _launchEmail(String email) async{
  var url = "mailto:${email.toString()}";
  if (await canLaunch(url)) {
    await launch(url);
  }
  else {
    throw 'An Error Occurred!';
  }
}

final String helpLine1 = "+91-11-23978046";
final String whatsapp = "+919013151515";
final String email = "ncov2019@gov.in";

class _HelplineState extends State<Helpline> {
  @override
  Widget build(BuildContext context) {

    final myDetails = Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(CupertinoIcons.phone_solid,
                            color: Color(0xFFED1D7F),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text("1075,+91-11-23978046" ,
                            style: TextStyle(
                                color: Colors.black, fontSize: 22.0)),),
                      ),
                    ],)),
                ],)
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(CupertinoIcons.phone_solid,
                            color: Color(0xFFED1D7F),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Container(child: Text("9013151515" ,
                            style: TextStyle(
                                color: Colors.black, fontSize: 22.0)),),
                      ),
                    ],)),
                ],)
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(CupertinoIcons.mail_solid,
                            color: Color(0xFFED1D7F),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text("ncov2019@gov.in",
                            style: TextStyle(
                                color: Colors.black, fontSize: 22.0)),),
                      ),
                    ],)),
                ],)
            ),



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(FontAwesomeIcons.phone,
                                color: Colors.white,
                                size: 35.0),
                            onTap: () {
                              if(helpLine1.isEmpty){
                                Fluttertoast.showToast(msg: "No Phone Number");
                              }
                              else{
                                _launchCaller(helpLine1);
                              }
                            },
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Material(
                        color: Colors.green,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(FontAwesomeIcons.whatsapp,
                                color: Colors.white,
                                size: 35.0),
                            onTap: () {
                              if(whatsapp.isEmpty){
                                Fluttertoast.showToast(msg: "No Phone Number");
                              }
                              else{
                                _launchWhatsApp(message: "Hii",phone:whatsapp);
                              }
                            },
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding
                          (
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Icon(FontAwesomeIcons.solidEnvelope,
                                color: Colors.white,
                                size: 35.0),
                            onTap: () {
                              if(email.isEmpty){
                                Fluttertoast.showToast(
                                    msg: "No Email",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                              else{
                                _launchEmail(email);
                              }

                            },
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),

      ),
    );


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFED1D7F),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ), onPressed: () => Navigator.of(context).pop(),),
            title: Text("Helpline Details"),

          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //myImage,
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 8.0, right: 8.0),
                  child: myDetails,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
