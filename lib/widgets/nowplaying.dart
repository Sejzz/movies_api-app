import 'package:flutter/material.dart';
import 'package:movies_api/pages/description.dart';

class NowPlaying extends StatelessWidget {
  final List nowplaying;
   const NowPlaying({Key? key, required this.nowplaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
       
           Text("Now Playing",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
     ),
     SizedBox(height: 14,),
       Container(height: 260,
       child: ListView.builder(itemCount: nowplaying.length,
       scrollDirection: Axis.horizontal,
        itemBuilder:  (context, index) {
        return InkWell(
          onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>description(
              name: nowplaying[index]['title'],
              bannerurl: 'http://image.tmdb.org/t/p/w500'+nowplaying[index]['backdrop_path'],
              posterurl:  'http://image.tmdb.org/t/p/w500'+nowplaying[index]['poster_path'],
              descrip: nowplaying[index]['overview'] ,
              vote: nowplaying[index]['vote_average'].toString(),
              launch_on: nowplaying[index]['release_date'],
            )));
            
          },
          child: Container(width: 140,
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'http://image.tmdb.org/t/p/w500'+nowplaying[index]['poster_path']
                 
                 
                  ))),
              ),
              Container(
                  padding: EdgeInsets.all(6),
                child: 

              Text( 
              nowplaying[index]['title'] != null
                                      ? nowplaying[index]['title']
                                      : 'Loading', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),)
          
            ],
          ),),
        );
        }),
       )
       ]),
    );
  }
}