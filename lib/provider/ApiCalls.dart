import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiDB extends ChangeNotifier {
  var countryName;
  var countryFlag;
  var decodeData;
  bool isLoading = true;
  var countryList;

  Future<Country?> getCountryList() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': '*/*',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMWNjYjE4YWE3M2MyODY1Zjc3NDg1NSIsInBob25lTnVtYmVyIjoiMDgwNTk3MDUzODMiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NjU1MTc3NjYsImV4cCI6MTY2NTUyMTM2Nn0.EB-xxWOH7eklJZrNN0nMCIgVpwAq8Wr2zxKK5BKTxCs',
    };
    var url = Uri.parse('https://restcountries.com/v3.1/all');
    final response = await http.get(
      url,
      headers: requestHeaders,
    );

    try {
      isLoading = true;
      notifyListeners();

      if (response.statusCode == 200 || response.statusCode == 201) {
        decodeData = jsonDecode(utf8.decode(response.bodyBytes));
        //var resp = Country.fromJson(decodeData).currencies?.mRU;

        for (var i = 0; i < decodeData.length; i++) {
          //tapping into the api properties.
          countryList = ((decodeData[i]['name']['official']));
          countryFlag = ((decodeData[i]['currencies']));
        }
        Future.delayed(Duration(seconds: 5)).then((value) {
          isLoading = false;
          notifyListeners();
        });

        notifyListeners();
      }
    } catch (e, s) {
      print('Error: $e');
      print('Location $s');
    }
  }
}

// List allendpoint =[];
// List searchresult=[];
//
// Searchresult=new List.from(allendpoint).where((element)=> element. Tostring. Tolowercase. Contain(country). tolowercase;
