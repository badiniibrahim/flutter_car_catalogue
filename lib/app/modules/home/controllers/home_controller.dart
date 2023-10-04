import 'package:car_catalogue/app/abstractions/i_controller.dart';
import 'package:car_catalogue/app/data/repositories/home_repository.dart';
import 'package:car_catalogue/app/modules/home/states.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController with IController {
  final HomeState state = HomeState();
  final HomeRepository _repository = HomeRepository();

  Future<void> fetchCar() async {
    actionPerform(
      action: () async {
        state.isLoading = true;
        final response = await _repository.fetchCar();
        state.carList = response;
      },
      callback: () {
        state.isLoading = false;
      },
    );
  }
}
