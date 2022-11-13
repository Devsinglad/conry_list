import 'package:conry_list/widgets/filter_widgets/sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../provider/themeProvider.dart';
import 'Mytile.dart';

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
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Deutsch',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'English',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Español',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Française',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Italiano',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Bahasa',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Português',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Pу́сский',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Svenska',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'Türkçe',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: '普通话',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
                  ),
                  MyTile(
                    title: 'بالعربية',
                    boarder: CircleBorder(),
                    color: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.grey;
                    }),
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
