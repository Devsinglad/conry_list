import 'package:conry_list/widgets/filter_widgets/sheet_fillter.dart';
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
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
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
              SheetWidget(
                  title: "Continent",
                  widget: IconButton(
                    icon:
                        Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  )),
              smallHeight,
              SheetWidget(
                title: "Time Zone",
                widget: IconButton(
                  icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
