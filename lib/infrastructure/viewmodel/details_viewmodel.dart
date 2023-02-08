import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spots_discovery/data/dto/response_dto.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/data/model/spot.dart';
import 'package:spots_discovery/ui/details.dart';

class DetailsViewModel extends ChangeNotifier {
  final SpotEndpoint _spotEndpoint;
  final int id;
  DetailsViewModel(this._spotEndpoint, this.id) {
    _init(id);
  }

  Spot? spots;

  Future<void> _init(int id) async {
    // Opening json file
    // var jsonString = await rootBundle.loadString("assets/json/spots.json");
    // Decoding json
    // var json = jsonDecode(jsonString);
    // Mapping data
    spots = (await _spotEndpoint.getSpotDetails(id));
    notifyListeners();
    
  }

}
