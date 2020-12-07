import 'dart:convert';

import 'package:covidapp/model/covidModel.dart';
import 'package:http/http.dart';

class Network {
  final String url = 'https://mazitekgh.com/covid19/v1/';

  // Network(this.url);

  Future<CovidModel> fetchData() async {
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      final covidModel = covidModelFromJson(response.body);
      print(covidModel.ghana.confirmed);
      return covidModel;
      // print(jsonDecode(response.body));
      // return CovidModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
