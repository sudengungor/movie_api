class MovieModel {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String description;
  final String director;
  final String releaseDate;
  final String image;
  final String movieBanner;
  final String rtScore;

  MovieModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.description,
    required this.director,
    required this.releaseDate,
    required this.image,
    required this.movieBanner,
    required this.originalTitleRomanised,
    required this.rtScore,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"] ?? "",
      title: json["title"] ?? "Unknown Movie",
      originalTitle: json["original_title"] ?? "",
      description: json["description"] ?? "No Description",
      director: json["director"] ?? "",
      releaseDate: json["release_date"] ?? "",
      image: json["image"] ?? "",
      movieBanner: json["movie_banner"] ?? "",
      originalTitleRomanised: json["original_title_romanised"] ?? '',
      rtScore: json["rt_score"] ?? '',
    );
  }
}
