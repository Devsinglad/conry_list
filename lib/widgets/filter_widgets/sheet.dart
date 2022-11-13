import 'package:conry_list/widgets/Mytext.dart';
import 'package:conry_list/widgets/customBox.dart';
import 'package:conry_list/widgets/filter_widgets/Mytile.dart';
import 'package:conry_list/widgets/filter_widgets/sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const.dart';
import '../../provider/themeProvider.dart';

class Sheet extends StatefulWidget {
  const Sheet({Key? key}) : super(key: key);

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return DraggableScrollableSheet(
      snap: false,
      controller: DraggableScrollableController(),
      initialChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: provider.isDark ? DarkModeColor : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              controller: scrollController,
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
                    ),
                  ),
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
                  smallHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBbox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: provider.isDark ? DarkModeColor : Colors.white,
                        radius: BorderRadius.circular(10),
                        border: Border.all(
                          color: provider.isDark ? Colors.white : Colors.black,
                          width: 2,
                        ),
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
        );
      },
    );
  }
}

class LanguageSheet extends StatefulWidget {
  const LanguageSheet({Key? key}) : super(key: key);

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return DraggableScrollableSheet(
      snap: false,
      controller: DraggableScrollableController(),
      initialChildSize: 0.8,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: provider.isDark ? DarkModeColor : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              controller: scrollController,
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
                    ),
                  ),
                  spaceHeight,
                  MyTile(
                    title: 'Bahasa',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Deutsch',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'English',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Español',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Française',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Italiano',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Bahasa',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Português',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Pу́сский',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Svenska',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'Türkçe',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: '普通话',
                    boarder: CircleBorder(),
                  ),
                  MyTile(
                    title: 'بالعربية',
                    boarder: CircleBorder(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
