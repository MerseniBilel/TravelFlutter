// To parse this JSON data, do
//
//     final bookingMoodel = bookingMoodelFromJson(jsonString);

import 'dart:convert';

BookingMoodel bookingMoodelFromJson(String str) =>
    BookingMoodel.fromJson(json.decode(str));

String bookingMoodelToJson(BookingMoodel data) => json.encode(data.toJson());

class BookingMoodel {
  BookingMoodel({
    this.email,
    this.creditcard,
    this.cvv,
    this.expirationdate,
    this.hotelId,
  });

  String email;
  String creditcard;
  String cvv;
  String expirationdate;
  String hotelId;

  factory BookingMoodel.fromJson(Map<String, dynamic> json) => BookingMoodel(
        email: json["email"],
        creditcard: json["creditcard"],
        cvv: json["cvv"],
        expirationdate: json["expirationdate"],
        hotelId: json["hotel_id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "creditcard": creditcard,
        "cvv": cvv,
        "expirationdate": expirationdate,
        "hotel_id": hotelId,
      };
}
