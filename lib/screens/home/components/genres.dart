import 'package:flutter/material.dart';
import 'package:movie_app_ui/components/genre_card.dart';
import 'package:movie_app_ui/constants.dart';

class Genres extends StatelessWidget {
  List<String> genres = [
    "Action",
    "Crime",
    "Comedy",
    "Drama",
    "Horror",
    "Animation",
  ];

  Genres({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) => GenresCard(genre: genres[index])),
    );
  }
}
