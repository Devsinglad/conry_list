import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/ApiCalls.dart';
import 'customBox.dart';

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
        return provider2.isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0xff5771F9),
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 1.7,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.decodeData.length,
                  itemBuilder: (context, i) {
                    var info = snapshot.decodeData[i];
                    return ListTile(
                      title: Text('${info['name']['official']}'),
                      subtitle: Text('${info['capital']}'),
                      leading: CustomBbox(
                        context: context,
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 20,
                        radius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage('${info['flags']['png']}'),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
