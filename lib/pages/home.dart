import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/pages/below_appbar.dart';
import 'package:movies_api/pages/login.dart';
import 'package:movies_api/widgets/drawer.dart';
import 'package:movies_api/widgets/nowplaying.dart';
import 'package:movies_api/widgets/toprated.dart';
import 'package:movies_api/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class home extends StatefulWidget {
  
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List nowPlaying = [];
  final String apikey = '384f265ce81a90234d85c9fe6ebb4d22';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODRmMjY1Y2U4MWE5MDIzNGQ4NWM5ZmU2ZWJiNGQyMiIsInN1YiI6IjYzYWNiN2JkYzU2ZDJkMDBhOTgwZGI5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7ERaCxuJZwo_gTp0fMqb-Lgn3LwYiaTaQXhsNRqZCL8';
   
   @override
   void initState(){
    loadmovies();
    super.initState();
   }


   loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    )
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map nowPlayresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      nowPlaying = nowPlayresult['results'];

    });
     print(trendingresult);
   }
 
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("What's New"),
        backgroundColor: Colors.black,
      ),
    //  backgroundColor: Color.fromARGB(255, 43, 41, 41),
      drawer: drawer(),

    
     body: ListView(  
      children: [
           below_appbar(),
      //  SizedBox(height:5,),
   
        TrendingMovies(
          trending: trendingmovies,),
        TopratedMovies(toprated:topratedmovies,),
        NowPlaying(nowplaying: nowPlaying)
      ],
     ),
    );
  }
}