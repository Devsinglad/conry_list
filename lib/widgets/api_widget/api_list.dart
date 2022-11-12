import 'package:conry_list/screens/countryDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/alphabets.dart';
import '../../provider/ApiCalls.dart';
import '../customBox.dart';

class ApiList extends StatelessWidget {
  const ApiList({
    Key? key,
    required this.provider2,
  }) : super(key: key);

  final ApiDB provider2;

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiDB>(
      builder: (context, snapshot, _) {
        // print(snapshot.decodeData
        //     .where((element) =>
        //         element['name']['official']
        //             .toString()
        //             .toUpperCase()
        //             .substring(0, 1) ==
        //         'A')
        //     .length);
        return provider2.isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0xff5771F9),
                  ),
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height / 1,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: MyAlphabets.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyAlphabets[index].toString(),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.decodeData
                              .where((element) =>
                                  element['name']['official']
                                      .toString()
                                      .toUpperCase()
                                      .substring(0, 1) ==
                                  MyAlphabets[index].toString())
                              .length,
                          itemBuilder: (context, i) {
                            List nestList = List.from(snapshot.decodeData.where(
                                (element) =>
                                    element['name']['official']
                                        .toString()
                                        .toUpperCase()
                                        .substring(0, 1) ==
                                    MyAlphabets[index].toString()));

                            var info = nestList[i];
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CountryDetails(
                                              countryDetails: info,
                                            )));
                              },
                              title: Text('${info['name']['official']}'),
                              subtitle: Text('${info['capital']}'),
                              leading: CustomBbox(
                                context: context,
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 20,
                                radius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:
                                      NetworkImage('${info['flags']['png']}'),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}