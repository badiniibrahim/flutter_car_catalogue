import 'package:car_catalogue/app/core/colors.style.dart';
import 'package:car_catalogue/app/core/utilities/size_config.dart';
import 'package:car_catalogue/app/core/utilities/theme.dart';
import 'package:car_catalogue/app/modules/home/controllers/home_controller.dart';
import 'package:car_catalogue/app/modules/home/widgets/car_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  AppBar _appBar() {
    return AppBar(
      title: const Text("Accueil"),
      titleTextStyle: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
        color: AppColors.white,
        fontFamily: 'muli',
      ),
      backgroundColor: AppColors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {
        controller.fetchCar();
      },
      builder: (_) {
        return Scaffold(
          appBar: _appBar(),
          body: Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.state.carList.length,
                itemBuilder: (BuildContext context, int index) {
                  final resource = controller.state.carList[index];
                  return CarItem(resource: resource);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
