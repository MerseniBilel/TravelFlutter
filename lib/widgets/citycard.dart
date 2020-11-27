import 'package:Testapi/model/cities.dart';
import 'package:Testapi/widgets/citydetails.dart';
import 'package:flutter/material.dart';

class Citycard extends StatelessWidget {
  const Citycard({
    Key key,
    @required this.city,
  }) : super(key: key);

  final Cities city;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CityDetails(
                    id: city.id,
                    name: city.name,
                    imgurl: city.imageurl,
                    description: city.description)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                city.imageurl,
                height: 200.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 200.0,
              width: 150.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.0, top: 8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white70,
                        ),
                        child: Text(
                          'New',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 10.0, top: 10.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white38,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '4.3',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 10.0, left: 8.0, right: 8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                city.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ZillaSlab',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
