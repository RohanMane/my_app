import 'package:connected_app/Services/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'item.dart';


void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'TO DO LIST';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
          backgroundColor: Colors.red[600],

        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final AuthenticationServices _auth = AuthenticationServices();

  TextEditingController _username = TextEditingController();

  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    void signInUser() async{
      dynamic result = await _auth.loginUser(_username.text, _pass.text);
        if(result == null){
          print("SIGN IN ERROR HERE");
        }
        else{
          print("SIGN SUCCESS");
        }

    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 40,),

          Container(
            padding: new EdgeInsets.fromLTRB(80, 0, 0, 0),
            child: Text(
              'WELCOME TO LOGIN PAGE',
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.red,
              ),

            ),
          ),

          SizedBox(height: 40,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username'

            ),

            controller: _username,



            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some valid text';
              }
              else{

                signInUser();
              }

































































            },
          ),

          SizedBox(height: 50,),

          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password'

            ),
            // The validator receives the text that the user has entered.

            controller: _pass,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some valid text';
              }
              if(value.length<=8){
                return 'Password shold be atleast eight characters';
              }
              return null;
            },
          ),

          SizedBox(height: 50,),


          Container(

            padding: new EdgeInsets.fromLTRB(160, 0, 0, 0),

            child: FlatButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Item()),
                  );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),

              ),
              color: Colors.red,
            ),


          ),

          SizedBox(height: 40,),

          Container(

            padding: new EdgeInsets.fromLTRB(160, 0, 0, 0),

            child: FlatButton(
              onPressed: () {

                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                }


                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Register()));

              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),

              ),
              color: Colors.red,
            ),


          ),





        ],
      ),
    );
  }
}
