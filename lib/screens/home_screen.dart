import 'package:flutter/material.dart';
import 'package:netflix_clone/model/nowplaying_movie_model.dart';
import 'package:netflix_clone/model/tvseresmodel.dart';
import 'package:netflix_clone/model/upcoming_movies_model.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widget/carousal_widget.dart';
import 'package:netflix_clone/widget/upcoming_movie_card.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  late Future<UpcomingMoviesModel> upcomingFuture;
  late Future<NowplayingMovieModel> nowplayingFuture;
  late Future<TvSeriesModel> tvseriesFuture;
  api_service api_service_obj = api_service();
  @override
  void initState() {
    
    super.initState();
    upcomingFuture = api_service_obj.getupcoming_movies();
    nowplayingFuture = api_service_obj.getnowplaying_movies();
    tvseriesFuture = api_service_obj.getTvSeries_movies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/netflix.png', height: 80, width: 120),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "MyList",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<TvSeriesModel>(
              future: tvseriesFuture,
              builder: (context, snapshot) {
                
                if (snapshot.hasData) {
                  return Carousal_sliding(data: snapshot.data!);
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 250,
              child: UpcomingMovieCard(
                headerText: "Upcoming Movies",
                model: true,
                upcomingFuture: upcomingFuture,
              ),
            ),
            SizedBox(
              height: 250,
              child: UpcomingMovieCard(
                headerText: "Now Playing Movies",
                model: false,
                nowplayingFuture: nowplayingFuture,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
