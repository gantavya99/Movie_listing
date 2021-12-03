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
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 4.5,
                color: Colors.black87,
                child: ListTile(
                    leading: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.6),
                          image: DecorationImage(image: )
                        ),
                      ),
                    ),
                    trailing: Text(
                      '...',
                      style: TextStyle(color: Colors.white),
                    ),
                    title: Text(
                      movies[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'sub',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => movieListViewDetails(
                                        movieName:
                                            movieList.elementAt(index).title,
                                            movie: movieList[index],
                                      )))
                        }));
          }),
    );
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
      body: Center(
        child: Container(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(null),
              label: Text(
                "${this.movie.director}",
              )),
        ),
      ),
    );
  }
}
