// class CovidModel {
//   final String confirmed;
//   final String recovered;
//   final String deaths;
//   final String time;
//   final String date;

//   CovidModel(
//       {this.confirmed, this.recovered, this.deaths, this.date, this.time});

//   factory CovidModel.fromJson(Map<String, dynamic> json) {
//     return CovidModel(
//       confirmed: json['comfirmed'],
//       recovered: json['recovered'],
//       deaths: json['deaths'],
//       date: json['date'],
//       time: json['time'],
//     );
//   }
// }

// To parse this JSON data, do
//
//     final covidModel = covidModelFromJson(jsonString);

import 'dart:convert';

CovidModel covidModelFromJson(String str) =>
    CovidModel.fromJson(json.decode(str));

String covidModelToJson(CovidModel data) => json.encode(data.toJson());

class CovidModel {
  CovidModel({
    this.ghana,
    this.global,
  });

  Ghana ghana;
  Ghana global;

  factory CovidModel.fromJson(Map<String, dynamic> json) => CovidModel(
        ghana: Ghana.fromJson(json["ghana"]),
        global: Ghana.fromJson(json["global"]),
      );

  Map<String, dynamic> toJson() => {
        "ghana": ghana.toJson(),
        "global": global.toJson(),
      };
}

class Ghana {
  Ghana({
    this.existing,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.date,
    this.time,
  });

  String existing;
  String confirmed;
  String recovered;
  String deaths;
  String date;
  String time;

  factory Ghana.fromJson(Map<String, dynamic> json) => Ghana(
        existing: json["existing"],
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "existing": existing,
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "date": date,
        "time": time,
      };
}
