import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/lotDto.dart';

class CommonController {
  static const baseUrl = "http://localhost:8080/api/";

  Map<String, String> _getHeaders() {

    var headers =  {
      "Content-Type" : "application/json",
      "Accept" : "application/json"
    };
    return headers;
  }

  Future<List<LotDto>> getAllLot() async {
    final response = await http.get(baseUrl + "lot");
    List<LotDto> lots = new List<LotDto>();

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      lots.add(LotDto.fromJson(json.decode(response.body)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get lots');
    }
    return lots;
  }
}