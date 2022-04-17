import 'package:flutter/material.dart';
import 'login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
        body:Container(
          height:MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(226, 56, 70, 1),
                  Color.fromRGBO(212, 63, 76, 1.0),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter
            ),
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 350, 0, 0)),
              new Text("TO DO LIST",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                ),),
              new Text("ITS TIME TO PRIORITIZE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),),
              Container(
                margin: EdgeInsets.fromLTRB(30, 300, 30, 0),
                child: RaisedButton(
                  onPressed:(){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));

                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.red,
                    ),

                  ),
                ),

              ),
            ],
          )
      ),
    );
  }
}

