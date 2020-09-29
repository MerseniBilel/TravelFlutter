import 'package:http/http.dart' as http;
import 'package:Testapi/model/cities.dart';

class CityService {
  static const String Url = 'http://10.0.2.2:8000/api/cities';

  //fetch data function

  static Future<List<Cities>> getcities() async {
    try {
      http.Response response = await http.get(Url);

      //
      if (response.statusCode == 200) {
        final List<Cities> listOfCities = citiesFromJson(response.body);
        return listOfCities;
      } else {
        return List<Cities>();
      }
    } catch (e) {
      return List<Cities>();
    }
  }
}
