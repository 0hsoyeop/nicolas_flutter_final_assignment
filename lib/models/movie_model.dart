/**
 * RawData (results) -> MovieModel
 */

/// 데이터 교환용
class RawResponse {
  // final Map<String, String> ? dates;
  final int page;
  final List<dynamic> results;
  final int totalPages;
  final int totalResults;

  RawResponse.fromJson(Map<String, dynamic> json)
      // : dates = json['dates'],
       : page = json['page'],
        results = json['results'],
        totalPages = json['total_pages'],
        totalResults = json['total_results'];
}

/// 데이터 교환용
class MovieModel {
  final bool adult;
  final String backdropPath;
  final List<dynamic> genreIds;
  final int id;
  final String originalLangauge;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final dynamic voteAverage;
  final int voteCount;

  MovieModel.fromJson(Map<String, dynamic> json)
  : adult = json['adult'],
  backdropPath = json['backdrop_path'],
  genreIds = json['genre_ids'],
  id = json['id'],
  originalLangauge = json['original_language'],
  originalTitle = json['original_title'],
  overview = json['overview'],
  popularity = json['popularity'],
  posterPath = json['poster_path'],
  releaseDate = json['release_date'],
  title = json['title'],
  video = json['video'],
  voteAverage = json['vote_average'],
  voteCount = json['vote_count'];
}