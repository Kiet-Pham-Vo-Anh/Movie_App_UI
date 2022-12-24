import 'package:flutter/material.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/screens/home/components/categories.dart';
import 'package:movie_app_ui/screens/home/components/genres.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CategoryList(),
        Genres(),
      ],
    );
  }
}
