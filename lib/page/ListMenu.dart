import 'package:flutter/material.dart';
import 'package:kiosk/page/Home.dart';
import 'package:kiosk/page/Information/InformationMenu.dart';

class ListMenu extends StatefulWidget {
  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListMenuPage(),
    );
  }
}

class ListMenuPage extends StatefulWidget {
  @override
  _ListMenuPageState createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  Menu selectedMenu;
  List<Menu> menu = [Menu("1|Kiosk"), Menu("2|Informasi")];

  List<DropdownMenuItem> lstMenu(List<Menu> menu) {
    List<DropdownMenuItem> items = [];
    for (var item in menu) {
      items.add(DropdownMenuItem(
        child: Text(item.menu.split("|")[1]),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                  Text(
                    "Medinfras Info",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(color: Colors.blue[300]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownButton(
                    style: TextStyle(fontSize: 15),
                    hint: Text("Pilih Menu"),
                    value: selectedMenu,
                    items: lstMenu(menu),
                    onChanged: (item) {
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (selectedMenu.menu.split("|")[0]) {
                        case "1":
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                          break;
                        case "2":
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InformationMenu()));
                          break;
                      }
                      setState(() {});
                    },
                    child: Text("Load Page"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogWarningMessage(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Menu {
  String menu;

  Menu(this.menu);
}
