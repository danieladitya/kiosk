import 'package:flutter/material.dart';
import 'package:kiosk/constant/constant.dart';
import 'package:http/http.dart' as http;

class Response {
  final String Status;
  final String Remarks;
  // ignore: non_constant_identifier_names
  Response({this.Status, this.Remarks});

  factory Response.fromJson(Map<String, dynamic> json) {
    var response = Response(Status: json["Status"], Remarks: json["Remarks"]);
    return response;
  }
}
