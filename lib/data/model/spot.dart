import 'package:json_annotation/json_annotation.dart';
import 'package:spots_discovery/data/model/category.dart';

part 'spot.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Spot {
  int id;
  String? title;
  String? trainStation;
  String? address;
  double? latitude;
  double? longitude;
  String? imageFullsize;
  String? imageThumbnail;
  bool? isRecommended;
  bool? isClosed;
  SpotCategory? mainCategory;
  List<SpotCategory>? tagsCategory;
  String? description;
  List<String>? imagesCollection;

  Spot({
    required this.id,
    this.title,
    this.trainStation,
    this.address,
    this.latitude,
    this.longitude,
    this.imageFullsize,
    this.imageThumbnail,
    this.isRecommended,
    this.isClosed,
    this.mainCategory,
    this.tagsCategory,
    this.description,
    this.imagesCollection
  });

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  Map<String, dynamic> toJson() => _$SpotToJson(this);
}
