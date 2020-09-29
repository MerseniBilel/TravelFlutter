import 'package:http/http.dart' as http;
import 'package:Testapi/model/hotels.dart';

class HotelService {
  static const String Url = 'http://10.0.2.2:8000/api/hotels';

  static Future<List<Hotels>> gethotels() async {
    try {
      http.Response response = await http.get(Url);

      //
      if (response.statusCode == 200) {
        final List<Hotels> listOfCities = hotelsFromJson(response.body);
        return listOfCities;
      } else {
        return List<Hotels>();
      }
    } catch (e) {
      return List<Hotels>();
    }
  }
}
