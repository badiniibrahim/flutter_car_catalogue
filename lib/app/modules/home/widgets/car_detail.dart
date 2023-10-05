import 'package:car_catalogue/app/core/utilities/image_utils.dart';
import 'package:car_catalogue/app/data/models/car_response_model.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final bool isOpen;
  final VoidCallback closeModal;
  final CarResponse car;

  const CarDetails({
    super.key,
    required this.isOpen,
    required this.closeModal,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: closeModal,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200, // Adjust the height as needed
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(generateCarImageUrl(car)),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100, // Adjust the height as needed
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    generateCarImageUrl(car, '29')),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 100, // Adjust the height as needed
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    generateCarImageUrl(car, '33')),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 100, // Adjust the height as needed
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    generateCarImageUrl(car, '13')),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${car.make} ${car.model}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: carDetailsWidgets(car),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> carDetailsWidgets(CarResponse car) {
    return <Widget>[
      _buildDetailRow("Make", car.make),
      _buildDetailRow("Model", car.model),
      _buildDetailRow("Year", car.year.toString()),
      _buildDetailRow("Fuel Type", car.fuelType),
      _buildDetailRow("Transmission", car.transmission),
      _buildDetailRow("Cylinders", car.cylinders.toString()),
      _buildDetailRow("Displacement", car.displacement.toString()),
      _buildDetailRow("Drive", car.drive),
      _buildDetailRow("City MPG", car.cityMpg.toString()),
      _buildDetailRow("Highway MPG", car.highwayMpg.toString()),
      _buildDetailRow("Combination MPG", car.combinationMpg.toString()),
    ];
  }

  Widget _buildDetailRow(String label, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          value ?? "N/A",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
