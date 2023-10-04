
import 'package:car_catalogue/app/abstractions/i_provider.dart';

abstract class IRepository<T> {
  IProvider<T> get provider;
}
