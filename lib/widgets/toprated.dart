import 'package:flutter/material.dart';
import 'package:movies_api/pages/description.dart';

class TopratedMovies extends StatelessWidget {
  final List toprated;
   const TopratedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
       
           Text("Top Rated Movies",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
     ),
     SizedBox(height: 14,),
       Container(height: 260,
       child: ListView.builder(itemCount: toprated.length,
       scrollDirection: Axis.horizontal,
        itemBuilder:  (context, index) {
        return InkWell(
          onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>description(
              name: toprated[index]['title'],
              bannerurl: 'http://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
              posterurl:  'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
              descrip: toprated[index]['overview'] ,
              vote: toprated[index]['vote_average'].toString(),
              launch_on: toprated[index]['release_date'],
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
                    'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                 
                 
                  ))),
              ),
              Container(
                  padding: EdgeInsets.all(6),
                child: 
              Text( 
              toprated[index]['title'] != null
                                      ? toprated[index]['title']
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