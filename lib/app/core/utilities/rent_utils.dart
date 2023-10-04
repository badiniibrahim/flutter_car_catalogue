double calculateCarRent(int cityMpg, int year) {
  const double basePricePerDay = 50.0;
  const double mileageFactor = 0.1;
  const double ageFactor = 0.05;

  final double mileageRate = cityMpg * mileageFactor;
  final double ageRate = (DateTime.now().year - year) * ageFactor;
  final double rentalRatePerDay = basePricePerDay + mileageRate + ageRate;
  return rentalRatePerDay;
}
