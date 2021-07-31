import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kiosk/constant/constant.dart';
import 'package:kiosk/constant/constant_style.dart';
import 'package:kiosk/page/Appointment/GetMedicalNumber.dart';
import 'package:kiosk/page/PrintAppointment.dart';
import 'package:kiosk/page/Walkin.dart';
import 'package:kiosk/widget/CustomeElevation.dart';
import 'package:kiosk/widget/iConMenu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kiosk Medinfras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: new AppBar(
        title: new Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(top: 16),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://picsum.photos/350/150?image=2"),
                                  fit: BoxFit.cover),
                            ));
                          },
                          autoplay: true,
                          itemCount: 3,
                          pagination: new SwiperPagination(),
                          viewportFraction: 0.8,
                          scale: 0.9,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child:
                                      Text("Silahkan Klik Tombol Dibawah Ini")),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomElevation(
                                    height: 110,
                                    child: ElevatedButton(
                                        child: iConMenu("Kedatangan",
                                            Icons.directions_walk_outlined),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (contex) =>
                                                      Walkin()));
                                        },
                                        style: mButtonStyle),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomElevation(
                                    height: 110,
                                    child: ElevatedButton(
                                      child: iConMenu("Buat Perjanjian",
                                          Icons.calendar_today_outlined),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GetMedicalNumber()));
                                      },
                                      style: mButtonStyle,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ]))
          ],
        ),
      ),
    );
  }
}
