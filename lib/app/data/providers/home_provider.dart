import 'package:car_catalogue/app/abstractions/i_provider.dart';
import 'package:car_catalogue/app/core/provider/api_provider.dart';
import 'package:dio/dio.dart';

class HomeProvider extends IProvider<Response> {
  @override
  String get endpoint => "/cars";

  Future<Response> fetchCar([String? name]) async {
    String value = name ?? "Ford";
    return await ApiProvider.instance.get(endpoint: "$endpoint?make=$value");
  }
}
