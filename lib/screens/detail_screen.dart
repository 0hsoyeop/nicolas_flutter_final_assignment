import 'package:flutter/material.dart';
import 'package:nicolas_flutter_final_assignment/models/movie_model.dart';
import 'package:nicolas_flutter_final_assignment/services/movie_service.dart';

class DetailScreen extends StatelessWidget {
  final MovieModel movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    List<int> makeStars(double data) {
      var filledStars = 0;
      var halfStars = 0;
      var emptyStars = 0;

      switch(data.floor()) {
        case 1:
          halfStars = 1;
          emptyStars = 4;
          break;
        case 2:
          filledStars = 1;
          emptyStars = 4;
          break;
        case 3:
          filledStars = 1;
          halfStars = 1;
          emptyStars = 3;
        case 4:
          filledStars = 2;
          emptyStars = 3;
          break;
        case 5:
          filledStars = 2;
          halfStars = 1;
          emptyStars = 2;
          break;
        case 6:
          filledStars = 3;
          emptyStars = 2;
          break;
        case 7:
          filledStars = 3;
          halfStars  = 1;
          emptyStars = 1;
          break;
        case 8:
          filledStars = 4;
          emptyStars = 1;
          break;
        case 9:
          filledStars = 4;
          halfStars = 1;
          break;
        case 10:
          filledStars = 5;
          break;

      }

      return [filledStars, halfStars, emptyStars];
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        top: true,
        child: Hero(
          tag: movie.id,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Image.network(
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fitHeight,
                  'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                ),
              ),
              FutureBuilder(future: MovieService.getMoviesDetail(movie.id), builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var genres = [];
                  for (var elm in snapshot.data!.genres) {
                    genres.add(elm['name']);
                  }
                  return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 80.0),
                          Text(snapshot.data!.title, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                for (int i=0; i<makeStars(snapshot.data!.voteAverage)[0]; i++) Icon(Icons.star_outlined, size: 26, color: Colors.amberAccent,),
                                for (int i=0; i<makeStars(snapshot.data!.voteAverage)[1]; i++) Icon(Icons.star_half_rounded, size: 26,  color: Colors.amberAccent),
                                for (int i=0; i<makeStars(snapshot.data!.voteAverage)[2]; i++) Icon(Icons.star_outline_rounded,  size: 26, color: Colors.amberAccent),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                              return Text(genres[index], style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                              ),);
                            }, separatorBuilder: (context, index) {
                              return Text(' | ', style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                              ),);
                            }, itemCount: genres.length),
                          ),
                          const SizedBox(height: 20.0),
                          Text('Storyline', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 20.0),

                          SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(movie.overview, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white, fontSize: 20))),
                          const SizedBox(height: 40.0),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 200,
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(child: Text('Buy ticket', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),

            ],
          ),
        ),
      ),
    );
  }
}
