import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kiosk/constant/constant_style.dart';
import 'package:kiosk/constant/constant.dart';
import 'package:kiosk/models/Appointment.dart';
import 'package:kiosk/models/Response.dart';
import 'package:kiosk/page/AppointmentDetail.dart';
import 'package:http/http.dart' as http;

class Walkin extends StatefulWidget {
  @override
  _WalkinState createState() => _WalkinState();
}

class _WalkinState extends State<Walkin> {
  bool isVisibleFormAppointment = false;
  bool isVisibleFormMrn = false;
  bool isVisibleConfirm = true;
  String messageText;
  TextEditingController _txtAppointmentNo = TextEditingController();
  TextEditingController _txtMedicalNo = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ResponseAppointment reqApm = null;

  void showFormAppointment() {
    setState(() {
      isVisibleConfirm = false;
      isVisibleFormMrn = false;
      isVisibleFormAppointment = true;
    });
  }

  void showFormMrn() {
    setState(() {
      isVisibleConfirm = false;
      isVisibleFormMrn = true;
      isVisibleFormAppointment = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        title: new Text(
          "Kedatangan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
      ),
      body: SafeArea(
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
                  width: 600,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                      child: Column(
                    children: [
                      Visibility(
                        //maintainSize: true,
                        //maintainAnimation: true,
                        visible: isVisibleConfirm,
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "Apakah anda ingat nomor perjanjian anda?",
                                    style: mTitleStyle,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: mButtonStyle,
                                        onPressed: () {
                                          // Respond to button press
                                          showFormAppointment();
                                        },
                                        child:
                                            Text('Ya', style: mButtonTxtStyle),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        style: mButtonStyle,
                                        onPressed: () {
                                          // Respond to button press
                                          showFormMrn();
                                        },
                                        child: Text('Tidak',
                                            style: mButtonTxtStyle),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                      Visibility(
                        visible: isVisibleFormAppointment,
                        child: Container(
                            child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Silahkan Masukan Nomor Perjanjian Anda Hari Ini",
                                      ),
                                      Container(
                                        width: 400,
                                        child: TextFormField(
                                          controller: _txtAppointmentNo,
                                          keyboardType: TextInputType.text,
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Mohon diisi';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: ElevatedButton(
                                          style: mButtonStyle,
                                          onPressed: () {
                                            // Validate returns true if the form is valid, or false otherwise.
                                            if (_formKey.currentState
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.

                                              ResponseAppointment.getApointment(
                                                      _txtAppointmentNo.text)
                                                  .then((value) {
                                                reqApm = value;
                                                setState(() {
                                                  reqApm = value;
                                                });

                                                if (reqApm.Status == "200") {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Berhasil diproses")));
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (contex) =>
                                                              AppointmentDetail(
                                                                data:
                                                                    reqApm.Data,
                                                              )));
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Gagal diproses")));
                                                }
                                              });
                                            }
                                          },
                                          child: Text(
                                            'Kirim',
                                            style: mButtonTxtStyle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        )),
                      ),
                      Visibility(
                        visible: isVisibleFormMrn,
                        child: Container(
                            child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Silahkan Masukan Nomor Rekamedis Anda",
                                      ),
                                      Container(
                                        width: 400,
                                        child: TextFormField(
                                          controller: _txtMedicalNo,
                                          keyboardType: TextInputType.text,
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Mohon diisi';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: ElevatedButton(
                                          style: mButtonStyle,
                                          onPressed: () {
                                            // Validate returns true if the form is valid, or false otherwise.
                                            if (_formKey.currentState
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Processing Success')));

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (contex) =>
                                                          AppointmentDetail()));
                                            }
                                          },
                                          child: Text(
                                            'Kirim',
                                            style: mButtonTxtStyle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        )),
                      )
                    ],
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
