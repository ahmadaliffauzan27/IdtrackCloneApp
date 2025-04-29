import 'dart:convert';

// class VehicleResponseModel {
//   int? deviceId;
//   String? nopol;
//   dynamic deletedAt;

//   VehicleResponseModel({
//     this.deviceId,
//     this.nopol,
//     this.deletedAt,
//   });

//   factory VehicleResponseModel.fromJson(String str) =>
//       VehicleResponseModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory VehicleResponseModel.fromMap(Map<String, dynamic> json) =>
//       VehicleResponseModel(
//         deviceId: json["DeviceID"],
//         nopol: json["Nopol"],
//         deletedAt: json["DeletedAt"],
//       );

//   Map<String, dynamic> toMap() => {
//         "DeviceID": deviceId,
//         "Nopol": nopol,
//         "DeletedAt": deletedAt,
//       };
// }

class VehicleResponseModel {
  final List<Vehicle> data;

  VehicleResponseModel({
    required this.data,
  });

  factory VehicleResponseModel.fromJson(String str) =>
      VehicleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VehicleResponseModel.fromMap(Map<String, dynamic> json) =>
      VehicleResponseModel(
        data: List<Vehicle>.from(json["data"].map((x) => Vehicle.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Vehicle {
  final int deviceId;
  final String nopol;
  final dynamic deletedAt;

  Vehicle({
    required this.deviceId,
    required this.nopol,
    this.deletedAt,
  });

  factory Vehicle.fromJson(String str) => Vehicle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vehicle.fromMap(Map<String, dynamic> json) => Vehicle(
        deviceId: json["DeviceID"],
        nopol: json["Nopol"],
        deletedAt: json["DeletedAt"],
      );

  Map<String, dynamic> toMap() => {
        "DeviceID": deviceId,
        "Nopol": nopol,
        "DeletedAt": deletedAt,
      };
}
