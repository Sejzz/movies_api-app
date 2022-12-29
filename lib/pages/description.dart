//import 'dart:html';

import 'package:flutter/material.dart';

class description extends StatelessWidget {

  final String name, descrip, bannerurl, posterurl, vote, launch_on;
  const description({
    Key? key, 
    required this.name, 
    required this.descrip, 
    required this.bannerurl, 
    required this.posterurl, 
    required this.vote, 
    required this.launch_on,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: ListView(children: [
        Container(
          height: 250,
          child: Stack(children: [
            Positioned(child: Container(  
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.network(bannerurl, fit: BoxFit.cover,),
            )),
            Positioned(bottom: 10,
              child: Text("Average Rating - " + vote, style: TextStyle(fontSize: 18),))
          ]),
        ),
        SizedBox(height: 15,),
        Container(padding: EdgeInsets.all(10),
        child: Text(name!=null?name:'Not Loaded', style: TextStyle(fontSize: 24),),
        ),
        Container(padding: EdgeInsets.only(left: 10),
        child: Text('Releasing On - '+launch_on, style: TextStyle(fontSize: 14),),

        ),

        Row(
          children: [Container(
            margin: EdgeInsets.all(8),
            height: 200,
            width: 100,
            child: Image.network(posterurl),
          ),
          Flexible(
            child: Container(
              child: Text(descrip, style: TextStyle(fontSize: 18)),
            ),
          )
          
          ],
        )
      ],)),
    );

  }
}
