import 'package:flutter/material.dart';
import '../../const.dart';
import '../../provider/themeProvider.dart';
import '../Mytext.dart';
import '../customBox.dart';
import 'LanguageSheet.dart';
import 'sheet.dart';

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
        InkWell(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                context: context,
                builder: (context) => LanguageSheet());
          },
          child: CustomBbox(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width / 6,
            border: Border.all(
              color: provider.isDark ? Colors.white : lightModeColor,
            ),
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
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              isDismissible: true,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              context: context,
              builder: (context) => Sheet(),
            );
          },
          child: CustomBbox(
            height: MediaQuery.of(context).size.height / 15,
            width: MediaQuery.of(context).size.width / 6,
            border: Border.all(
              color: provider.isDark ? Colors.white : lightModeColor,
            ),
            radius: BorderRadius.circular(10),
            context: context,
            color: provider.isDark ? DarkModeColor : Colors.white,
            widget: Row(
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  color: provider.isDark ? Colors.white : lightModeColor,
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
        ),
      ],
    );
  }
}
