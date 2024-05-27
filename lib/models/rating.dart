import 'package:json_annotation/json_annotation.dart';

part "rating.g.dart";

@JsonSerializable()
class Rating {
  final double rate;
  final int count;

  Rating({
    this.rate = 0,
    this.count = 0,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RatingToJson(this);
  }
}
