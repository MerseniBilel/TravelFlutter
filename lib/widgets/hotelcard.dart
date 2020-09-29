import 'package:Testapi/model/hotels.dart';
import 'package:Testapi/widgets/hoteldetails.dart';
import 'package:flutter/material.dart';

class Hotelcard extends StatelessWidget {
  const Hotelcard({
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
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              child: Image.network(
                hotel.imageurl,
                width: 110.0,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 11.0),
                  Text(
                    hotel.address,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  ),
                  SizedBox(height: 11.0),
                  Text(
                    ' \$ ${hotel.price.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
