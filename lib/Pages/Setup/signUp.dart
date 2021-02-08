import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:housing/Pages/Setup/signIn.dart';


import 'package:flutter/material.dart';
import 'package:housing/dashboard.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if(input.length < 6){
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signUp,
                child: Text('Register'),
              ),
            ],
          )
      ),
    );
  }

  Future<void> signUp() async{
    await Firebase.initializeApp();
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
      }catch(e){
        print(e.message);
      }
    }
  }

}
