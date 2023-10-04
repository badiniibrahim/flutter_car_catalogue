class CarResponse {
  final int? cityMpg;
  final String? getCarResponseClass;
  final int? combinationMpg;
  final int? cylinders;
  final double? displacement;
  final String? drive;
  final String? fuelType;
  final int? highwayMpg;
  final String? make;
  final String? model;
  final String? transmission;
  final int? year;

  CarResponse({
    this.cityMpg,
    this.getCarResponseClass,
    this.combinationMpg,
    this.cylinders,
    this.displacement,
    this.drive,
    this.fuelType,
    this.highwayMpg,
    this.make,
    this.model,
    this.transmission,
    this.year,
  });

  factory CarResponse.fromJson(dynamic json) {
    if (json == null) {
      return CarResponse();
    }

    return CarResponse(
      cityMpg: json["city_mpg"],
      getCarResponseClass: json["class"],
      combinationMpg: json["combination_mpg"],
      cylinders: json["cylinders"],
      displacement: json["displacement"].toDouble(),
      drive: json["drive"],
      fuelType: json["fuel_type"],
      highwayMpg: json["highway_mpg"],
      make: json["make"],
      model: json["model"],
      transmission: json["transmission"],
      year: json["year"],
    );
  }
}
