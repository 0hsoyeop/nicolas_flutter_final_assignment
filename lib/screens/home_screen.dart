import 'package:flutter/material.dart';
import 'package:nicolas_flutter_final_assignment/services/movie_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                Text('Popular Movies',
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 20.0),
                FutureBuilder(future: MovieService.getPopularMovies(), builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].backdropPath}'),
                              
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 15.0);
                          },
                          itemCount: snapshot.data!.length),
                    );
                  } else {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
                const SizedBox(height: 20.0),
                Text('Now in Cinemas',
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 20.0),
                FutureBuilder(future: MovieService.getNowPlayingMovies(), builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 240,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}',
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.none),
                                ),
                                const SizedBox(height: 10.0),
                                SizedBox(
                                  width: 160,
                                  child: Text(snapshot.data![index].title,
                                      maxLines: 3,
                                      style: Theme.of(context).textTheme.displayMedium),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 15.0);
                          },
                          itemCount: snapshot.data!.length),
                    );
                  } else {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
                const SizedBox(height: 20.0),
                Text('Coming Soon',
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 20.0),
                FutureBuilder(future: MovieService.getMoviesComingSoon(), builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 260,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}',
                                      width: 160,
                                      height: 160,
                                      fit: BoxFit.none),
                                ),
                                const SizedBox(height: 10.0),
                                SizedBox(
                                  width: 160,
                                  child: Text(snapshot.data![index].title,
                                      maxLines: 3,
                                      style: Theme.of(context).textTheme.displayMedium),
                                ),                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 15.0);
                          },
                          itemCount: snapshot.data!.length),
                    );
                  } else {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
