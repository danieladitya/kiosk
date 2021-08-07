import 'package:flutter/material.dart';
import 'package:kiosk/constant/constant.dart';
import 'package:kiosk/constant/constant_style.dart';
import 'package:kiosk/models/Appointment.dart';
import 'package:kiosk/page/Home.dart';
import 'package:kiosk/widget/iConMenu.dart';

class AppointmentDetail extends StatefulWidget {
  final AppointmentData data;
  AppointmentDetail({this.data});
  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        title: new Text(
          "Data Kunjungan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
      ),
      body: SafeArea(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              color: mBackgroundColor,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        child: Image.asset('logo.png')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 600,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListView(
                      padding: EdgeInsets.all(30),
                      children: [
                        Container(
                          child: Table(
                            children: [
                              TableRow(children: [
                                Row(children: [
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      width: 100,
                                      alignment: Alignment.centerLeft,
                                      child: Text('Nama')),
                                  Container(
                                      width: 300,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(widget.data.PatientName))
                                ]),
                              ]),
                              TableRow(children: [
                                Row(children: [
                                  Container(
                                      width: 100,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Kunjungan')),
                                  Container(
                                      width: 300,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Poli Umum'))
                                ]),
                              ]),
                              TableRow(children: [
                                Row(children: [
                                  Container(
                                      width: 100,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Dokter')),
                                  Container(
                                      width: 300,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(widget.data.ParamedicName))
                                ]),
                              ]),
                              TableRow(children: [
                                Row(children: [
                                  Container(
                                      width: 100,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Tanggal')),
                                  Container(
                                      width: 300,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(widget.data.StartDate))
                                ]),
                              ]),
                              TableRow(children: [
                                Row(children: [
                                  Container(
                                      width: 100,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Pukul')),
                                  Container(
                                      width: 300,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(widget.data.StartTime))
                                ]),
                              ]),
                              TableRow(children: [
                                Row(children: [
                                  Container(
                                      width: 100,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text('No. Antrian')),
                                  Container(
                                      width: 400,
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child:
                                          Text(widget.data.QueueNo.toString()))
                                ]),
                              ]),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 100,
                            child: Row(
                              children: [
                                ElevatedButton(
                                    child: Row(
                                      children: [
                                        Icon(Icons.print_rounded),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            child:
                                                Text("Cetak Bukti Kedatangan")),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => MyHomePage()),
                                      );
                                    },
                                    style: mButtonStyle),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
