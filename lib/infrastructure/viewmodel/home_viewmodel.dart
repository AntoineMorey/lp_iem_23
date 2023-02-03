import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spots_discovery/data/dto/response_dto.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/data/model/spot.dart';


class HomeViewModel extends ChangeNotifier {
  final SpotEndpoint _spotEndpoint;
  HomeViewModel(this._spotEndpoint) {
    _init();
  }

  List<Spot> spots = <Spot>[];

  Future<void> _init() async {
    // Opening json file
    var jsonString = await rootBundle.loadString("assets/json/spots.json");
    // Decoding json
    var json = jsonDecode(jsonString);
    // Mapping data
    spots = List<Map<String, dynamic>>.from(json["data"])
        .map((json) => Spot.fromJson(json))
        .toList();
    notifyListeners();
  }

  void loadMore() async {
    ResponseDto response = await _spotEndpoint.getSpots();
    spots = response.data;
  }

  Spot getRandom() {
    /// TODO
    return Spot(id: 0);
  }

  void navigateToDetail(BuildContext context) {
    /// TODO
  }

  void getSpotByName(String name) {
    /// TODO
  }
}
