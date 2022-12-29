import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/pages/login.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    
        backgroundColor: Colors.black,
        child: ListView(
        padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
         children: [
      //const DrawerHeader(
      //   decoration: BoxDecoration(
      //     color: Colors.black,
      //   ),
      //   child: Text('Drawer Header'),
      // ),
      ListTile(
        title: const Text('LOG OUT', style: TextStyle(color: Colors.white),),
        onTap: () {
           FirebaseAuth.instance.signOut().then((value) {
            print("Signed Out");
            Navigator.push(context, MaterialPageRoute(builder: 
            (context) => login()));
          });
          // Update the state of the app.
          // ...
          Navigator.pop(context);
        },
      ),],
      )
    );
  }
}