import 'package:car_catalogue/app/core/utilities/image_utils.dart';
import 'package:car_catalogue/app/core/utilities/rent_utils.dart';
import 'package:car_catalogue/app/data/models/car_response_model.dart';
import 'package:car_catalogue/app/modules/home/controllers/home_controller.dart';
import 'package:car_catalogue/app/modules/home/widgets/car_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CarItem extends StatelessWidget {
  final CarResponse resource;
  final HomeController controller;
  const CarItem({
    super.key,
    required this.resource,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: const Color.fromRGBO(245, 248, 255, 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${resource.make} ${resource.model}',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Text(
                '\$',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${calculateCarRent(resource.cityMpg ?? 0, resource.year ?? 2000)}",
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '/day',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Image.network(
            generateCarImageUrl(resource),
            fit: BoxFit.contain,
            width: double.infinity,
            height: 150.0,
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/steering-wheel.svg',
                    width: 20.0,
                    height: 20.0,
                  ),
                  Text(
                    resource.transmission == 'a' ? 'Automatic' : 'Manual',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/tire.svg',
                    width: 20.0,
                    height: 20.0,
                  ),
                  Text(
                    resource.drive!.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/gas.svg',
                    width: 20.0,
                    height: 20.0,
                  ),
                  Text(
                    '${resource.cityMpg} MPG',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Get.to(CarDetails(
                car: resource,
                isOpen: true,
                closeModal: () {
                  Get.back();
                },
              ));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blue, // Change to your preferred color
              ),
            ),
            child: const Text(
              'View More',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
