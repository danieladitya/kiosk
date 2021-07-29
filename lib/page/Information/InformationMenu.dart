import 'package:flutter/material.dart';

class InformationMenu extends StatefulWidget {
  @override
  _InformationMenuState createState() => _InformationMenuState();
}

class _InformationMenuState extends State<InformationMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InformationMenuPage(),
    );
  }
}

class InformationMenuPage extends StatefulWidget {
  @override
  _InformationMenuPageState createState() => _InformationMenuPageState();
}

class _InformationMenuPageState extends State<InformationMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text("Informasi"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: lstGroupInfo.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              tilePadding: EdgeInsets.all(10),
              childrenPadding: EdgeInsets.all(10),
              collapsedBackgroundColor: Colors.orange,
              backgroundColor: Colors.orange[100],
              title: new Text(
                lstGroupInfo[index].title,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                new Column(
                  children: _buildExpandView(
                      context, lstGroupInfo[index].title, lstGroupInfo[index]),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _buildExpandView(BuildContext context, String title, groupInfo groupInfo) {
    List<Widget> columnContent = [];
    for (String content in groupInfo.contents) {
      columnContent.add(
        new ListTile(
          title: new Text(
            content,
            style: new TextStyle(fontSize: 25),
          ),
          leading: Icon(groupInfo.icon),
          onTap: () {
            _showDialogWarningMessage(context, title, content);
          },
        ),
      );
    }
    return columnContent;
  }
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

class groupInfo {
  final String title;
  List<String> contents = [];
  final IconData icon;

  groupInfo(this.title, this.contents, this.icon);
}

List<groupInfo> lstGroupInfo = [
  new groupInfo(
    'Dokter',
    ['dr. A', 'dr. B', 'dr. C', 'dr. D'],
    Icons.people,
  ),
  new groupInfo(
    'Poli',
    ['Poli A', 'Poli B', 'Poli C'],
    Icons.place,
  ),
];
