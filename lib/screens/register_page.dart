import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:parlor_main/screens/home_page.dart';
import 'package:parlor_main/screens/login_page.dart';

class RegisterPage extends StatefulWidget {

  static const String id = "login";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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
                  obscureText: true,
                  controller: passwordCtrl,
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.vpn_key_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: 'Re-enter Password',
                      hintText: 'Enter secure password'),
                  validator: (value) {
                    if (value != passwordCtrl.text) {
                      return 'Password not matching';
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
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailCtrl.text,
                          password: passwordCtrl.text,
                        );

                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (_) =>
                            HomePage()), (Route<dynamic> route) => false);

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                          SmartDialog.showToast(
                              "The password provided is too weak.");
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                          SmartDialog.showToast(
                              "The account already exists for that email.");
                        }
                      } catch (e) {
                        print(e);
                        SmartDialog.showToast("${e}");
                      }
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
                child: Text('Already have an account? Login'))
            ],
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  // final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)*\w+[\w-]$');
  final RegExp regex = RegExp(r'\S+@\S+\.\S+');
  return regex.hasMatch(email);
}