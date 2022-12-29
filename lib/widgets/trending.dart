import 'package:flutter/material.dart';
import 'package:movies_api/pages/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
   const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
       
           Text("Trending Movies",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
     ),
     SizedBox(height: 14,),
       Container(height: 260,
       child: ListView.builder(itemCount: trending.length,
       scrollDirection: Axis.horizontal,
        itemBuilder:  (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>description(
              name: trending[index]['title'],
              bannerurl: 'http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
              posterurl:  'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
              descrip: trending[index]['overview'] ,
              vote: trending[index]['vote_average'].toString(),
              launch_on: trending[index]['release_date'],
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
                    'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                 
                 
                  ))),
              ),
              Container(
               padding: EdgeInsets.all(6),
               // width: 150,
                child: 
              Text( 
              trending[index]['title'] != null
                                      ? trending[index]['title']
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