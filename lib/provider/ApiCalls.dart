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
  TextEditingController controller = TextEditingController();
  var searchResult;

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
        searchResult = jsonDecode(utf8.decode(response.bodyBytes));
        // results = decodeData.map((e) => Country.fromJson(e)).toList;
        // print(results.length);
        //var resp = Country.fromJson(decodeData).currencies?.mRU;

        for (var i = 0; i < decodeData.length; i++) {
          //tapping into the api properties.
          countryList = ((decodeData[i]['timezones']));
          countryFlag = ((decodeData[i]['continents'][0]));
          print(countryFlag);
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

  Future getCountriesByContinent(List continent) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': '*/*',
        "Authorization":
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMWNjYjE4YWE3M2MyODY1Zjc3NDg1NSIsInBob25lTnVtYmVyIjoiMDgwNTk3MDUzODMiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NjU1MTc3NjYsImV4cCI6MTY2NTUyMTM2Nn0.EB-xxWOH7eklJZrNN0nMCIgVpwAq8Wr2zxKK5BKTxCs',
      };
      var url = Uri.parse('https://restcountries.com/v3.1/all');
      var list = [];

      var response = await http.get(url, headers: requestHeaders);
      var decodeData = json.decode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < decodeData.length; i++) {
        //tapping into the api properties.
        var continent = ((decodeData[i]['continents']));
      }
      var continentList = [];
      for (var i = 0; i < continent.length; i++) {
        continentList.add(list
            .where((element) => element.continent == continent[i])
            .toList());
      }
      if (continentList.isEmpty) {
        //do something
      } else {
        return {'data': continentList, 'length': continentList.length};
      }
    } catch (e) {
      print(e);
    }
    //do something
  }

  // Future<Country?> getRegion(List region) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-type': 'application/json',
  //     'Accept': '*/*',
  //     "Authorization":
  //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMWNjYjE4YWE3M2MyODY1Zjc3NDg1NSIsInBob25lTnVtYmVyIjoiMDgwNTk3MDUzODMiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE2NjU1MTc3NjYsImV4cCI6MTY2NTUyMTM2Nn0.EB-xxWOH7eklJZrNN0nMCIgVpwAq8Wr2zxKK5BKTxCs',
  //   };
  //   var url = Uri.parse('https://restcountries.com/v3.1/region/$region');
  //   final response = await http.get(
  //     url,
  //     headers: requestHeaders,
  //   );
  //
  //   try {
  //     isLoading = true;
  //     notifyListeners();
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       decodeData = jsonDecode(utf8.decode(response.bodyBytes));
  //       searchResult = jsonDecode(utf8.decode(response.bodyBytes));
  //       // results = decodeData.map((e) => Country.fromJson(e)).toList;
  //       // print(results.length);
  //       //var resp = Country.fromJson(decodeData).currencies?.mRU;
  //
  //       for (var i = 0; i < decodeData.length; i++) {
  //         //tapping into the api properties.
  //         countryList = ((decodeData[i]['timezones']));
  //         countryFlag = ((decodeData[i]['continents']));
  //         //print(countryList);
  //       }
  //       Future.delayed(Duration(seconds: 5)).then((value) {
  //         isLoading = false;
  //         notifyListeners();
  //       });
  //
  //       notifyListeners();
  //     }
  //   } catch (e, s) {
  //     print('Error: $e');
  //     print('Location $s');
  //   }
  // }

}

// if (selected.isNotEmpty) {
// getCountriesByRegion(
// selected);
// //do something
// } else {
// //do something
// }
