import 'package:flutter/material.dart';

class iConMenu extends StatefulWidget {
  final String title;
  final IconData icons;
  const iConMenu(this.title, this.icons);

  @override
  _iConMenuState createState() => _iConMenuState();
}

class _iConMenuState extends State<iConMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              width: 110,
              height: 110,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icons,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
