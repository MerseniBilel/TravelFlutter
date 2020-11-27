import 'package:Testapi/model/hotels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'hotelcard.dart';
import 'hoteldetails.dart';

// ignore: must_be_immutable
class CityDetails extends StatefulWidget {
  const CityDetails(
      {Key key, this.id, this.name, this.imgurl, this.description})
      : super(key: key);
  final int id;
  final String name;
  final String imgurl;
  final String description;
  @override
  _CityDetailsState createState() =>
      _CityDetailsState(id, name, imgurl, description);
}

class _CityDetailsState extends State<CityDetails> {
  List<Hotels> hotels;
  _CityDetailsState(this.id, this.name, this.imgurl, this.description);
  final int id;
  final String name;
  final String imgurl;
  final String description;

  Future<List<Hotels>> getDetails() async {
    String Url = 'http://10.0.2.2:8000/api/cities/$id/';

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

  @override
  void initState() {
    super.initState();
    getDetails().then((value) {
      setState(() {
        hotels = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  imgurl,
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 350,
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      Spacer(),
                      Text(
                        name,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 27.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 210.0,
                      child: ListView.builder(
                          itemCount: hotels == null ? 0 : hotels.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Hotels hotel = hotels[index];
                            return Hotelcard2(hotel: hotel);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Hotelcard2 extends StatelessWidget {
  const Hotelcard2({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  final Hotels hotel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Hoteldetails(
                      id: hotel.id,
                      name: hotel.name,
                      description: hotel.description,
                      price: hotel.price,
                      rating: hotel.rating,
                      address: hotel.address,
                      imageurl: hotel.imageurl,
                      cityId: hotel.cityId,
                      createdAt: hotel.createdAt,
                      updatedAt: hotel.updatedAt,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 30.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                hotel.imageurl,
                height: 200.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
