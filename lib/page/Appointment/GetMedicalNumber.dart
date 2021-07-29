import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk/common/Helper.dart';
import 'package:kiosk/constant/constant.dart';

class GetMedicalNumberPage extends StatefulWidget {
  @override
  _GetMedicalNumberPageState createState() => _GetMedicalNumberPageState();
}

class _GetMedicalNumberPageState extends State<GetMedicalNumberPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetMedicalNumber(),
    );
  }
}

class GetMedicalNumber extends StatefulWidget {
  @override
  GetMedicalNumberState createState() => GetMedicalNumberState();
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

class GetMedicalNumberState extends State<GetMedicalNumber> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtMedicalNo = TextEditingController();
  String medicalNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Silahkan Masukan Nomor Rekam Medis Anda",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtMedicalNo,
                  autofocus: true,
                  cursorHeight: 20,
                  textAlign: TextAlign.center,
                  maxLength: 11,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    new MedicalNumberFormatter()
                  ],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Isi Nomor Rekam Medis';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mButton),
                      ),
                      onPressed: () {
                        setState(() {
                          print(txtMedicalNo.text.length);
                          if (txtMedicalNo.text.length < 1) {
                            _showDialogWarningMessage(
                              context,
                              "FAILED",
                              "Rekam Medis tidak boleh kosong",
                            );
                          } else {
                            _showDialogWarningMessage(
                              context,
                              (txtMedicalNo.text.length == 11)
                                  ? "SUCCESS"
                                  : "FAILED",
                              (txtMedicalNo.text.length == 11)
                                  ? txtMedicalNo.text
                                  : "Harap input lengkap nomor rekam medis",
                            );
                          }
                        });
                      },
                      child: Text('Submit')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
