import 'patient.dart';

class Appointment {
  int id;
  DateTime appointmentDate;
  Patient patient;
  bool isCancelled;

  Appointment({this.id, this.appointmentDate, this.patient, this.isCancelled});
}
