import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/config/utils/constants.dart';
import 'package:netflix_clone/model/tvseresmodel.dart';

class Carousal_sliding extends StatelessWidget {
  final TvSeriesModel data;
  const Carousal_sliding({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var carouselOptions = CarouselOptions(
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      aspectRatio: 16 / 9,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          var url = data.results[index].backdropPath.toString();
          return GestureDetector(
            onTap: () {},
            child: CachedNetworkImage(imageUrl: "$image_url$url"),
          );
        },
        options: carouselOptions,
      ),
    );
  }
}
