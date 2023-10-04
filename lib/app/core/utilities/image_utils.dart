import 'package:car_catalogue/app/data/models/car_response_model.dart';

String generateCarImageUrl(CarResponse car, [String? angle]) {
  final url = Uri.parse('https://cdn.imagin.studio/getimage');
  final make = car.make;
  final modelFamily = car.model!.split(' ')[0];
  final year = car.year;

  final queryParameters = {
    'customer': 'hrjavascript-mastery',
    'make': make,
    'modelFamily': modelFamily,
    'zoomType': 'fullscreen',
    'modelYear': '$year',
    'angle': angle,
  };

  final imageUrl = Uri(
    scheme: url.scheme,
    host: url.host,
    path: url.path,
    queryParameters: queryParameters,
  );

  return imageUrl.toString();
}
