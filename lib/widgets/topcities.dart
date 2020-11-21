import 'dart:ui';

import 'package:Testapi/model/cities.dart';
import 'package:Testapi/services/cityService.dart';
import 'package:Testapi/widgets/citycard.dart';
import 'package:flutter/material.dart';

class TopCities extends StatefulWidget {
  @override
  _TopCitiesState createState() => _TopCitiesState();
}

class _TopCitiesState extends State<TopCities> {
  List<Cities> cities;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    CityService.getcities().then((value) {
      setState(() {
        cities = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      child: ListView.builder(
          itemCount: cities == null ? 0 : cities.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Cities city = cities[index];
            return Citycard(city: city);
          }),
    );
  }
}
