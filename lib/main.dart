import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print('OOPS !!!! ERROR ${snapshot.error.toString()}');
            return Text('SOMETHING WENT WRONG!');
          }
          else if(snapshot.hasData){
            return SplashScreen();
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}