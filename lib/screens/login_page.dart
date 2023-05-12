import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:parlor_main/screens/home_page.dart';
import 'package:parlor_main/screens/register_page.dart';

class LoginPage extends StatefulWidget {

  static const String id = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: double.infinity,
                      height: 350,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/images/login.png')),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20,),
                      suffixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if(!isValidEmail(value)){
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.vpn_key_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if(value.length < 8){
                      return 'Need password of atleast 8 characters';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 50,),

              Container(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print("Validation : Ok");
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailCtrl.text,
                            password: passwordCtrl.text
                        );
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (_) =>
                            HomePage()), (Route<dynamic> route) => false);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          SmartDialog.showToast("No user found");
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          SmartDialog.showToast("Wrong password");
                          print('Wrong password provided for that user.');
                        }
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RegisterPage()));
                },
                child: Text("New User? Create Account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}