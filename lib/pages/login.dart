import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/pages/home.dart';
import 'package:movies_api/pages/signup.dart';
import 'package:movies_api/widgets/reusable.dart';



class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                      const Text("LOG IN", style: TextStyle(color: Colors.black,
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

                        signInsignUpButton(context, true, (){
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, 
                          password: _passwordTextController.text).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });

                        }),

                       SignUpOption()
                      

              ],
            ),
            
          )),
        )
        );
  }



Row SignUpOption(){
  return Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text("Don't have an account? ",
    style: TextStyle(color: Colors.black),),
    GestureDetector(onTap: () {
      Navigator.push(context, 
      MaterialPageRoute(builder: (context) => const signup()),);
    },
    child: const Text("Sign up", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ),),)
  ],
  
  );
}
}
