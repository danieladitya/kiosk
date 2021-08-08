import 'dart:convert';
import 'package:kiosk/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:kiosk/models/Response.dart';

class AppointmentData {
  int AppointmentID;
  String AppointmentNo;
  // dynamic AppointmentDate;
  // dynamic AppointmentTime;
  String StartDate;
  String StartTime;
  // dynamic EndDate;
  // dynamic EndTime;
  // String DepartmentId;
  // String ServiceUnitCode;
  // String ServiceUnitName;
  // int RoomID;
  // String RoomCode;
  // String RoomName;
  // int ParamedicID;
  // String ParamedicCode;
  String ParamedicName;
  // String SpecialtyID;
  // String SpecialtyName;
  // int VisitTypeID;
  // String VisitTypeCode;
  // String VisitTypeName;
  // dynamic VisitTypeDuration;
  // int GuestID;
  // String MedicalNo;
  // dynamic FirstName;
  // dynamic MiddleName;
  // dynamic LastName;
  String PatientName;
  // String CityOfBirth;
  // String DateOfBirth;
  // String Sex;
  // String MobileNo1;
  // String MobileNo2;
  // int IsNewPatient;
  int QueueNo;
  // int PatientID;
  // dynamic PatientInformation;
  // int BusinessPartnerID;
  // dynamic BusinessPartnerCode;
  // int HealthcareServiceUnitID;
  // dynamic CreatedDate;
  // dynamic OperationalTimeCode;
  // dynamic OperationalTimeName;
  // String AppointmentStatus;
  // dynamic GcAppointmentMethod;
  // dynamic AppointmentMethod;
  // dynamic Username;
  // dynamic HealthcareGroup;
  // dynamic HealthcareID;
  // String CustomerType;
  // dynamic DiagnosisText;
  // dynamic MedicalResumeText;
  // dynamic PlanningResumeText;

  AppointmentData({
    this.AppointmentID,
    this.AppointmentNo,
    // this.appointmentDate,
    // this.appointmentTime,
    this.StartDate,
    this.StartTime,
    // this.endDate,
    // this.endTime,
    // this.departmentId,
    // this.serviceUnitCode,
    // this.serviceUnitName,
    // this.roomId,
    // this.roomCode,
    // this.roomName,
    // this.paramedicId,
    // this.paramedicCode,
    this.ParamedicName,
    // this.specialtyId,
    // this.specialtyName,
    // this.visitTypeId,
    // this.visitTypeCode,
    // this.visitTypeName,
    // this.visitTypeDuration,
    // this.guestId,
    // this.medicalNo,
    // this.firstName,
    // this.middleName,
    // this.lastName,
    this.PatientName,
    // this.cityOfBirth,
    // this.dateOfBirth,
    // this.sex,
    // this.mobileNo1,
    // this.mobileNo2,
    // this.isNewPatient,
    this.QueueNo,
    // this.patientId,
    // this.patientInformation,
    // this.businessPartnerId,
    // this.businessPartnerCode,
    // this.healthcareServiceUnitId,
    // this.createdDate,
    // this.operationalTimeCode,
    // this.operationalTimeName,
    // this.appointmentStatus,
    // this.gcAppointmentMethod,
    // this.appointmentMethod,
    // this.username,
    // this.healthcareGroup,
    // this.healthcareId,
    // this.customerType,
    // this.diagnosisText,
    // this.medicalResumeText,
    // this.planningResumeText,
  });

  factory AppointmentData.assign(Map<String, dynamic> obj) {
    return AppointmentData(
      AppointmentID: obj != null ? obj["AppointmentID"] as int : 0,
      AppointmentNo: obj != null ? obj["AppointmentNo"] as String : "",
      PatientName: obj != null ? obj["PatientName"] as String : "aaa",
      ParamedicName: obj != null ? obj["ParamedicName"] as String : "",
      StartDate: obj != null ? obj["StartDate"] as String : "",
      StartTime: obj != null ? obj["StartTime"] as String : "",
      QueueNo: obj != null ? obj["QueueNo"] as int : 0,
    );
    ;
  }
}

class ResponseAppointment {
  final String Status;
  final String Remarks;
  final AppointmentData Data;
  ResponseAppointment({this.Status, this.Remarks, this.Data});

  factory ResponseAppointment.assign(Map<String, dynamic> obj) {
    AppointmentData dataApm;
    String data = jsonEncode(dataApm);

    if (obj["Status"] == "200") {
      data = obj["Data"];
    }

    return ResponseAppointment(
        Status: obj["Status"],
        Remarks: obj["Remarks"],
        Data: AppointmentData.assign(jsonDecode(data)));
  }

  static Future<ResponseAppointment> getApointment(String AppointmentNo) async {
    var appointmentno = AppointmentNo.replaceAll("/", "_");
    String endpoint = Constant.uRLApi + "/appointment/apmno/" + appointmentno;

    var result = await http.get(Uri.parse(endpoint));
    var jObject = json.decode(result.body);
    var userData = (jObject as Map<String, dynamic>);
    return ResponseAppointment.assign(userData);
  }
}
