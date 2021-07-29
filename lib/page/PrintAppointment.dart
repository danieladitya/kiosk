import 'package:flutter/material.dart';
import 'package:kiosk/constant/constant.dart';
import 'package:kiosk/page/AppointmentDetail.dart';

class PrintAppointment extends StatefulWidget {
  @override
  _PrintAppointmentState createState() => _PrintAppointmentState();
}

class _PrintAppointmentState extends State<PrintAppointment> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
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
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Masukan Nomor Perjanjian",
                                ),
                                Container(
                                  width: 400,
                                  child: TextFormField(
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
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
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              mButton),
                                    ),
                                    onPressed: () {
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState.validate()) {
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
                                    child: Text('Submit'),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


// Form(
//                   key: _formKey,
//                   child: Container(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       Text(
//                         "Masukan Kode Perjanjian",
//                       ),
//                       Container(
//                         color: Colors.green,
//                         width: 300,
//                         child: TextFormField(
//                           // The validator receives the text that the user has entered.
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter some text';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 16.0),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Validate returns true if the form is valid, or false otherwise.
//                             if (_formKey.currentState.validate()) {
//                               // If the form is valid, display a snackbar. In the real world,
//                               // you'd often call a server or save the information in a database.
//                               print("Kirim");
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text('Processing Data')));
//                             }
//                           },
//                           child: Text('Submit'),
//                         ),
//                       ),
//                     ],
//                   )),
//                 ),