import 'package:flutter/material.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/models/movie.dart';
import 'package:movie_app_ui/screens/home/components/movie_card.dart';
import 'dart:math' as math;

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController? _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion show on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            initialPage = value;
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }

  AnimatedBuilder buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController!,
        builder: (context, child) {
          double value = 0;
          if (_pageController!.position.haveDimensions) {
            // use 0.083 because 180*0.083 = 7 almost and we need to rotate our poster 7 degree.
            value = index - _pageController!.page!.toDouble();
            // use clamp so that our value vary from -1 to 1.
            value = (value * 0.083).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(movie: movies[index]),
            ),
          );
        },
      );
}
