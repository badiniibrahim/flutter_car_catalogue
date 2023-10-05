import 'package:car_catalogue/app/core/colors.style.dart';
import 'package:car_catalogue/app/core/utilities/size_config.dart';
import 'package:car_catalogue/app/core/utilities/theme.dart';
import 'package:car_catalogue/app/modules/home/controllers/home_controller.dart';
import 'package:car_catalogue/app/modules/home/widgets/car_item.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final List<String> _suggestions = [
    'Acura',
    'Alfa Romeo',
    'Aston Martin',
    'Audi',
    'Bentley',
    'BMW',
    'Buick',
    'Cadillac',
    'Chevrolet',
    'Chrysler',
    'Citroen',
    'Dodge',
    'Ferrari',
    'Fiat',
    'Ford',
    'GMC',
    'Honda',
    'Hyundai',
    'Infiniti',
    'Jaguar',
    'Jeep',
    'Kia',
    'Lamborghini',
    'Land Rover',
    'Lexus',
    'Lincoln',
    'Maserati',
    'Mazda',
    'McLaren',
    'Mercedes-Benz',
    'MINI',
    'Mitsubishi',
    'Nissan',
    'Porsche',
    'Ram',
    'Rolls-Royce',
    'Subaru',
    'Tesla',
    'Toyota',
    'Volkswagen',
    'Volvo',
  ];

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
          appBar: EasySearchBar(
            onSuggestionTap: (data) {
              controller.fetchCar(data);
            },
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: AppColors.black,
            title: Text(
              'CarHub',
              style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                color: AppColors.white,
                fontFamily: 'muli',
              ),
            ),
            onSearch: (value) => {},
            suggestions: _suggestions,
          ),
          body: Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.state.carList.length,
                itemBuilder: (BuildContext context, int index) {
                  final resource = controller.state.carList[index];
                  return CarItem(
                    resource: resource,
                    controller: controller,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
