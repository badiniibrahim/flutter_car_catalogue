import 'package:car_catalogue/app/data/models/car_response_model.dart';
import 'package:get/get.dart';

class HomeState {
  // isLoading
  final RxBool _isLoading = RxBool(true);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<CarResponse> _carList = <CarResponse>[].obs;
  set carList(value) => _carList.value = value;
  List<CarResponse> get carList => _carList;
}
