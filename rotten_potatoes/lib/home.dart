// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotten Potatoes'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10.0, child: movieImage(movieList[index].images[0])),
            ]);
            // return Card(
            //     elevation: 4.5,
            //     color: Colors.black87,
            //     child: ListTile(
            //         leading: CircleAvatar(
            //           child: Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(13.6),
            //               image: DecorationImage(
            //                   image: NetworkImage(movieList[index].images[0]),
            //                   fit: BoxFit.cover),
            //             ),
            //           ),
            //         ),
            //         trailing: Text(
            //           '...',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         title: Text(
            //           movieList[index].title,
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         subtitle: Text(
            //           'sub',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         onTap: () => {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => movieListViewDetails(
            //                             movieName:
            //                                 movieList.elementAt(index).title,
            //                             movie: movieList[index],
            //                           )
            // ))
            //             }
            // )
            // );
          }),
    );
  }
}

Widget movieCard(Movie movie, BuildContext context) {
  return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  movieListViewDetails(movieName: movie.title, movie: movie))),
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8, left: 54.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      movie.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    )),
                    Text(
                      "Rating : ${movie.imdbRating}/10",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Released : ${movie.released}",
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      Text("${movie.runtime}",
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                      Text(
                        "${movie.rated}",
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ));
}

Widget movieImage(String imageUrl) {
  return Container(
    width: 100,
    height: 100,
    // ignore: prefer_const_constructors
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
    ),
  );
}

class MovieDetailsThumbNails extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbNails({Key? key, required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnail), fit: BoxFit.cover),
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 60,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie)),
        ],
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year}.${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.cyan,
          ),
        ),
        Text(
          "${movie.title}",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        Text.rich((TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            children: <TextSpan>[
              TextSpan(text: movie.plot),
              TextSpan(
                  text: "More...",
                  style: TextStyle(
                    color: Colors.indigoAccent,
                  ))
            ])))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field: 'Cast', value: movie.actor),
          MovieField(field: 'Directors', value: movie.director),
          MovieField(field: 'Awards', value: movie.awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  const MovieField({required this.field, required this.value});
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$field : ',
          style: TextStyle(
              color: Colors.black38, fontSize: 12, fontWeight: FontWeight.w700),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsExtraPosters({Key? key, required this.posters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'More Movie Posters'.toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: 8,
                  ),
              itemCount: posters.length,
              itemBuilder: (BuildContext context, int index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(posters[index]),
                              fit: BoxFit.cover)),
                    ),
                  )),
        )
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
        child: ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: 160,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover),
        ),
      ),
    ));
  }
}

class movieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const movieListViewDetails(
      {Key? key, required this.movieName, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          MovieDetailsThumbNails(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images),
        ],
      ),
    );
  }
}
