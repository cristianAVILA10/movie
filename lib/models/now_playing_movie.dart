import 'dart:convert';
import 'package:movie_2/models/movie.dart';

class NowPlayingMovie {
    Dates? dates;
    int? page;
    List<Movie>? results;
    int? totalPages;
    int? totalResults;

    NowPlayingMovie({
        this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory NowPlayingMovie.fromRawJson(String str) => NowPlayingMovie.fromJson(json.decode(str));

    factory NowPlayingMovie.fromJson(Map<String, dynamic> json) => NowPlayingMovie(
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        page: json["page"],
        results: json["results"] == null ? [] : List<Movie>.from(json["results"]!.map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    DateTime? maximum;
    DateTime? minimum;

    Dates({
        this.maximum,
        this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum: json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
    };
}

