import 'package:flutter/material.dart';
import 'package:netflix_clone/config/utils/constants.dart';
import 'package:netflix_clone/model/nowplaying_movie_model.dart';
import 'package:netflix_clone/model/upcoming_movies_model.dart';



class UpcomingMovieCard extends StatelessWidget {
  final Future<UpcomingMoviesModel>? upcomingFuture;
  final Future<NowplayingMovieModel>? nowplayingFuture;

  final String headerText;
  final bool model;
  const UpcomingMovieCard({
    super.key,
    this.upcomingFuture,
    required this.headerText,
    this.nowplayingFuture,
    required this.model,
  });
  

  @override
  Widget build(BuildContext context) {
    final futureTouse = upcomingFuture ?? nowplayingFuture;
    return FutureBuilder(future: futureTouse, builder:(context,snapshot){
      if(snapshot.hasData){
        var moviedata;
        if(snapshot.data is NowplayingMovieModel){
          moviedata = snapshot.data as NowplayingMovieModel;
        }else{
          moviedata = snapshot.data as UpcomingMoviesModel;

        }
        var data = moviedata.results;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(headerText,
            style: TextStyle(
              fontSize: 20,
            ),),
            Expanded(
              child: ListView.builder(itemCount: data!.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
               itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network("$image_url${data[index].posterPath}"),
                );
              },),
            )
          ],
        );
      }
      throw Exception("failed");
    });
  }
}

