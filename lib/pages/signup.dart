import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/pages/home.dart';
import 'package:movies_api/widgets/reusable.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 10),
            child: Column(
              children: <Widget>[Image.asset("assets/images/movie.jpg", width: 250, height: 150,),
               const SizedBox(
                        height: 40,
                      ),
                      const Text("SIGN UP", style: TextStyle(color: Colors.black,
                       fontSize: 28, fontWeight: FontWeight.bold),),
                       const SizedBox(height: 30,),

                       reusableTextField("Enter Email", Icons.email, 
                       false, _emailTextController),
                       const SizedBox(
                        height: 25,
                       ),
                       reusableTextField("Enter Password", Icons.lock_outline,
                        true, _passwordTextController),
                        const SizedBox(height: 30,),

                        signInsignUpButton(context, false, (){
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                           password: _passwordTextController.text).then((value) {
                            print("Created New Account");
                                Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => home()));

                           }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                           });
                      

                        }),
   ]))
         )) );
  }
}