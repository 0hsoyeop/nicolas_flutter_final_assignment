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

class MovieDetailModel {
  final bool adult;
  final String backdropPath;
  final Map<String, dynamic> belongsToCollection;
  final int budget;
  final List<dynamic> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<dynamic> originCountry;
  final String originLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final dynamic posterPath;
  final List<dynamic> productionCompanies;
  final List<dynamic> productionCountries;
  final String relaseDate;
  final int revenue;
  final int runtime;
  final List<dynamic> spokenLanguage;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
  : adult = json['adult'],
  backdropPath = json['backdrop_path'],
  belongsToCollection = json['belongs_to_collection'],
  budget = json['budget'],
  genres = json['genres'],
  homepage = json['homepage'],
  id  = json['id'],
  imdbId = json['imdb_id'],
  originCountry = json['origin_country'],
  originLanguage = json['original_language'],
  originalTitle = json['original_title'],
  overview = json['overview'],
  popularity = json['popularity'],
  posterPath = json['poster_path'],
  productionCompanies = json['production_companies'],
  productionCountries = json['production_countries'],
  relaseDate = json['release_date'],
  revenue = json['revenue'],
  runtime = json['runtime'],
  spokenLanguage = json['spoken_languages'],
  status = json['status'],
  tagline = json['tagline'],
  title = json['title'],
  video = json['video'],
  voteAverage = json['vote_average'],
  voteCount = json['vote_count'];

}