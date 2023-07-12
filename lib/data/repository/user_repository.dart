import 'package:lazday_kuliner/data/model/place_model.dart';
import 'package:lazday_kuliner/data/remote/api_service.dart';

class UserRepository {
  // ignore: non_constant_identifier_names
  final apiService = ApiService();
  Future<PlaceModel> getPlace() => apiService.getPlace();
}
