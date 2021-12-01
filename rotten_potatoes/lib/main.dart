// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: MovieListView()));
}

class MovieListView extends StatelessWidget {
  List movies = [
    'Avatar',
    'I am Legend',
    '300',
    'The Avengers',
    'The Wolf of the Wall Street',
    'Interstellar',
    'Game of Thrones',
    'Vikings',
    'Gotham',
    'Power',
    'Narcos',
    'Breaking Bad',
    'Coming soon',
    'Coming soon',
    'Coming soon'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotten Potatoes'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 4.5,
                color: Colors.black87,
                child: ListTile(
                    leading: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.6),
                        ),
                        child: Text("H"),
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
                                        movieName: movies.elementAt(index),
                                      )))
                        }));
          }),
    );
  }
}

class movieListViewDetails extends StatelessWidget {
  final String movieName;

  const movieListViewDetails({Key? key, required this.movieName})
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
                "${movieName}",
                
              )),
        ),
      ),
    );
  }
}
