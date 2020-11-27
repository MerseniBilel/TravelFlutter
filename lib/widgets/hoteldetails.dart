import 'package:Testapi/model/booking.dart';
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
// ignore: must_be_immutable

class Hoteldetails extends StatelessWidget {
  int id;
  String name;
  String description;
  int rating;
  int price;
  String address;
  String imageurl;
  int cityId;
  DateTime createdAt;
  DateTime updatedAt;

  Hoteldetails({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.rating,
    @required this.price,
    @required this.address,
    @required this.imageurl,
    @required this.cityId,
    @required this.createdAt,
    @required this.updatedAt,
  });
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
                    imageurl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Spacer(),
                            Icon(
                              Icons.favorite_border,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ],
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
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20.0,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              address,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Rating(rate: rating),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                        Spacer(),
                        Text(
                          '\$ $price',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ],
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
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 50.0),
                      decoration: BoxDecoration(
                        color: Colors.pink[300],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: BookButton(id: id),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  final int rate;

  Rating({@required this.rate});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: rate >= 1 ? Colors.white : Colors.white30,
          ),
          SizedBox(
            width: 3.0,
          ),
          Icon(
            Icons.star,
            color: rate >= 2 ? Colors.white : Colors.white30,
          ),
          SizedBox(
            width: 3.0,
          ),
          Icon(
            Icons.star,
            color: rate >= 3 ? Colors.white : Colors.white30,
          ),
          SizedBox(
            width: 3.0,
          ),
          Icon(
            Icons.star,
            color: rate >= 4 ? Colors.white : Colors.white30,
          ),
          SizedBox(
            width: 3.0,
          ),
          Icon(
            Icons.star,
            color: rate >= 5 ? Colors.white : Colors.white30,
          ),
          SizedBox(
            width: 6.0,
          ),
          Text(
            '$rate.0',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class BookButton extends StatelessWidget {
  const BookButton({
    Key key,
    this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    _showPaymentModel(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Payment(hotelid: id);
          });
    }

    return FlatButton(
      onPressed: () {
        _showPaymentModel(context);
      },
      child: Text(
        'Book Now',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 25.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Payment extends StatefulWidget {
  const Payment({Key key, this.hotelid}) : super(key: key);
  final int hotelid;
  @override
  _PaymentState createState() => _PaymentState(hotelid);
}

Future<BookingMoodel> CreateBooking(String cardNumber, String expiryDate,
    String cardHolderName, String cvvCode, String hotelid, context) async {
  final String url = "http://10.0.2.2:8000/api/bookings";
  final http.Response response = await http.post(url, body: {
    "email": cardHolderName,
    "creditcard": cardNumber,
    "cvv": cvvCode,
    "expirationdate": expiryDate,
    "hotel_id": hotelid
  });

  if (response.statusCode == 201) {
    final String bodyString = response.body;
    print(bodyString);
    showSimpleNotification(
        Text("Your Request has been sent successfully CHECK YOUR EMAIL"),
        background: Colors.green);
  }
}

class _PaymentState extends State<Payment> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  _PaymentState(this.hotelid);
  final int hotelid;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      onCreditCardModelChange: onmodelchange,
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.pink,
                      ),
                      child: FlatButton(
                        onPressed: () async {
                          print(cardHolderName);
                          print(cardNumber);
                          print(expiryDate);
                          print(hotelid);
                          print(cvvCode);

                          CreateBooking(cardNumber, expiryDate, cardHolderName,
                              cvvCode, hotelid.toString(), context);
                        },
                        child: Text(
                          'Book',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void onmodelchange(CreditCardModel model) {
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }
}
