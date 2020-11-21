import 'package:Testapi/model/hotels.dart';
import 'package:Testapi/services/hotelService.dart';
import 'package:Testapi/widgets/hotelcard.dart';
import 'package:flutter/material.dart';

class TopHotels extends StatefulWidget {
  @override
  _TopHotelsState createState() => _TopHotelsState();
}

class _TopHotelsState extends State<TopHotels> {
  List<Hotels> hotels;

  @override
  void initState() {
    super.initState();
    HotelService.gethotels().then((value) {
      setState(() {
        hotels = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ),
      height: 260,
      child: ListView.builder(
        itemCount: hotels == null ? 0 : hotels.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Hotels hotel = hotels[index];
          return Hotelcard(hotel: hotel);
        },
      ),
    );
  }
}
