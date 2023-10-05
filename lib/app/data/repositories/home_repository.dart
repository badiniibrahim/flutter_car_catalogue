import 'package:car_catalogue/app/abstractions/i_repository.dart';
import 'package:car_catalogue/app/data/models/car_response_model.dart';
import 'package:dio/dio.dart';

import '../providers/home_provider.dart';

class HomeRepository extends IRepository<Response> {
  @override
  HomeProvider get provider => HomeProvider();

  Future<List<CarResponse>> fetchCar([String? name]) async {
    final response = await provider.fetchCar(name);
    var car = response.data as List;
    List<CarResponse> carList =
        car.map((m) => CarResponse.fromJson(m)).toList();
    return carList;
  }
}
