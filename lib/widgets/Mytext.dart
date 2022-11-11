import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/themeProvider.dart';

Widget MyText({
  required BuildContext context,
  final String? title,
  final double? size,
  final FontWeight? weight,
}) {
  final provider = Provider.of<ThemeProvider>(context);
  return Text(
    title!,
    style: TextStyle(
      fontWeight: weight,
      color: provider.isDark ? Colors.white : Colors.black,
      fontSize: size ?? MediaQuery.textScaleFactorOf(context) * 20,
    ),
  );
}
