class Movie
{
  String title;
  String poster_path;
  
  Movie.fromJson(Map<String,dynamic> myJson)
  {
    title=myJson['title'];
    poster_path='http://image.tmdb.org/t/p/original${myJson['poster_path']}';
  }
}
