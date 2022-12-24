import 'package:flutter/material.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/models/movie.dart';
import 'package:movie_app_ui/screens/home/components/categories.dart';
import 'package:movie_app_ui/screens/home/components/genres.dart';
import 'package:movie_app_ui/screens/home/components/movie_card.dart';
import 'package:movie_app_ui/screens/home/components/movie_carousel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(),
          Genres(),
          SizedBox(height: kDefaultPadding),
          MovieCarousel(),
        ],
      ),
    );
  }
}
