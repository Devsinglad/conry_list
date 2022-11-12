import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const.dart';
import '../../provider/themeProvider.dart';
import '../Mytext.dart';
import '../customBox.dart';
import 'sheet.dart';
import 'sheet_fillter.dart';

class Translaton_Filter extends StatelessWidget {
  const Translaton_Filter({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final ThemeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBbox(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width / 5,
          shadowColor: provider.isDark ? Colors.white : lightModeColor,
          radius: BorderRadius.circular(10),
          context: context,
          color: provider.isDark ? DarkModeColor : Colors.white,
          widget: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.language,
                color: provider.isDark ? Colors.white : lightModeColor,
              ),
              MyText(
                context: context,
                title: 'EN',
                size: MediaQuery.textScaleFactorOf(context) * 13,
              ),
            ],
          ),
        ),
        CustomBbox(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width / 5,
          shadowColor: provider.isDark ? Colors.white : lightModeColor,
          radius: BorderRadius.circular(10),
          context: context,
          color: provider.isDark ? DarkModeColor : Colors.white,
          widget: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: provider.isDark ? Colors.white : lightModeColor,
                ),
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    context: context,
                    builder: (context) => Sheet(),
                  );
                },
              ),
              MyText(
                context: context,
                title: 'Filter',
                weight: FontWeight.w500,
                size: MediaQuery.textScaleFactorOf(context) * 13,
              )
            ],
          ),
        ),
      ],
    );
  }
}