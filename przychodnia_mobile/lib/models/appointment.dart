import 'patient.dart';

class Appointment {
  int id;
  DateTime appointmentDate;
  Patient patient;
  bool isCancelled;
  bool isFinished;

  Appointment(
      {this.id,
      this.appointmentDate,
      this.patient,
      this.isCancelled,
      this.isFinished});

  bool wasYesterday() {
    DateTime now = DateTime.now();
    return appointmentDate
            .isAfter(DateTime(now.year, now.month, now.day - 1)) &&
        appointmentDate.isBefore(DateTime(now.year, now.month, now.day));
  }

  bool isToday() {
    DateTime now = DateTime.now();
    return appointmentDate.isAfter(DateTime(now.year, now.month, now.day)) &&
        appointmentDate.isBefore(DateTime(now.year, now.month, now.day + 1));
  }

  bool isTomorrow() {
    DateTime now = DateTime.now();
    return appointmentDate
            .isAfter(DateTime(now.year, now.month, now.day + 1)) &&
        appointmentDate.isBefore(DateTime(now.year, now.month, now.day + 2));
  }

  String prettyAppointmentDate() {
    return appointmentDate.toString().substring(0, 16);
  }
}
