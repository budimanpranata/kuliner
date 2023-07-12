// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:lazday_kuliner/data/constan.dart';
import 'package:lazday_kuliner/data/model/place_model.dart';

import 'package:lazday_kuliner/data/remote/loging_interceptor.dart';

class ApiService {
  Client _client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);
  Future<PlaceModel> getPlace() async {
    final url = Uri.https(Constant.baseUrl, Constant.apiPlace);
    final response = await _client.get(url);
    final json = jsonDecode(response.body);

    return PlaceModel.fromJson(json);
  }
}
