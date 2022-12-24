import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [kDefaultShadow],
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(movie.poster),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              movie.title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/star_fill.svg",
                height: 20,
              ),
              SizedBox(width: kDefaultPadding / 2),
              Text(
                "${movie.rating}",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          )
        ],
      ),
    );
  }
}
