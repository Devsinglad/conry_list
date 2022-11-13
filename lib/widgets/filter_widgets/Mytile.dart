import 'package:flutter/material.dart';

import '../Mytext.dart';

class MyTile extends StatefulWidget {
  final String title;

  final OutlinedBorder? boarder;
  MyTile({
    Key? key,
    required this.title,
    this.boarder,
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
        checkColor: Colors.grey,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Colors.grey;
        }),
        shape: widget.boarder,
        value: value,
        onChanged: (newvalue) {
          setState(() {
            value = newvalue!;
          });
        },
      ),
    );
  }
}
