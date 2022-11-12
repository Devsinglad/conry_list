import 'package:conry_list/widgets/Mytext.dart';
import 'package:conry_list/widgets/customBox.dart';
import 'package:conry_list/widgets/filter_widgets/sheet_fillter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../models/alphabets.dart';
import '../../provider/themeProvider.dart';

class Sheet extends StatefulWidget {
  const Sheet({Key? key}) : super(key: key);

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  var selected;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: provider.isDark ? DarkModeColor : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SheetWidget(
                      title: 'Filter',
                      widget: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Icon(Icons.close),
                        ),
                      )),
                  spaceHeight,
                  ExpansionTile(
                    title: MyText(
                      context: context,
                      title: 'Continent',
                    ),
                    children: [
                      MyTile(
                        title: 'Africa',
                      ),
                      MyTile(
                        title: 'Antarctica',
                      ),
                      MyTile(
                        title: 'Asia',
                      ),
                      MyTile(
                        title: 'Europe',
                      ),
                      MyTile(
                        title: 'North America',
                      ),
                      MyTile(
                        title: 'South America',
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: MyText(
                      context: context,
                      title: 'Time Zone',
                    ),
                    children: [
                      MyTile(
                        title: 'GMT+1:00',
                      ),
                      MyTile(
                        title: 'GMT+2:00',
                      ),
                      MyTile(
                        title: 'GMT+3:00',
                      ),
                      MyTile(
                        title: 'GMT+4:00',
                      ),
                      MyTile(
                        title: 'GMT+5:00',
                      ),
                      MyTile(
                        title: 'GMT+6:00',
                      ),
                      MyTile(
                        title: 'GMT+7:00',
                      ),
                      MyTile(
                        title: 'GMT-6:00',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBbox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: provider.isDark ? DarkModeColor : Colors.white,
                        radius: BorderRadius.circular(10),
                        border: Border.all(
                            color:
                                provider.isDark ? Colors.white : Colors.black,
                            width: 2),
                        context: context,
                        widget: Center(
                          child: MyText(
                            context: context,
                            title: 'Reset',
                          ),
                        ),
                      ),
                      CustomBbox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.5,
                        color: Colors.deepOrange,
                        radius: BorderRadius.circular(5),
                        context: context,
                        widget: Center(
                          child: MyText(
                            context: context,
                            title: 'Show Result',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyTile extends StatefulWidget {
  final String title;

  MyTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyTile> createState() => _State();
}

class _State extends State<MyTile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MyText(
        context: context,
        title: widget.title,
        weight: FontWeight.w500,
      ),
      trailing: Checkbox(
          value: value,
          onChanged: (newvalue) {
            setState(() {
              value = newvalue!;
            });
          }),
    );
  }
}
