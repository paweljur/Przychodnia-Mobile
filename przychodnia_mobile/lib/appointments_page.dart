import 'package:flutter/material.dart';
import 'package:przychodnia_mobile/models/patient.dart';
import 'package:przychodnia_mobile/models/appointment.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List<Appointment> _appointments = [
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().subtract(Duration(days: 1, hours: 2)),
      patient: Patient(
        id: 1,
        name: 'Jan',
        surname: 'Nowak',
        identityNumber: '97123093821',
      ),
      isCancelled: false,
      isFinished: true,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().subtract(Duration(days: 1, hours: 1)),
      patient: Patient(
        id: 1,
        name: 'Krzyszłof',
        surname: 'Leszczyński',
        identityNumber: '84037483921',
      ),
      isCancelled: false,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().subtract(Duration(days: 1, hours: 3)),
      patient: Patient(
        id: 1,
        name: 'Jacek',
        surname: 'Młot',
        identityNumber: '42367898734',
      ),
      isCancelled: false,
      isFinished: true,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().subtract(Duration(days: 1)),
      patient: Patient(
        id: 1,
        name: 'Jarosław',
        surname: 'Wiśniewski',
        identityNumber: '87023969483',
      ),
      isCancelled: true,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().add(Duration(hours: 2)),
      patient: Patient(
        id: 1,
        name: 'Adam',
        surname: 'Wójcik',
        identityNumber: '98473829328',
      ),
      isCancelled: false,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().add(Duration(hours: 1)),
      patient: Patient(
        id: 1,
        name: 'Jan',
        surname: 'Nowak',
        identityNumber: '97123093821',
      ),
      isCancelled: false,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().add(Duration(hours: 3)),
      patient: Patient(
        id: 1,
        name: 'Krzyszłof',
        surname: 'Leszczyński',
        identityNumber: '84037483921',
      ),
      isCancelled: false,
      isFinished: true,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now(),
      patient: Patient(
        id: 1,
        name: 'Jacek',
        surname: 'Młot',
        identityNumber: '42367898734',
      ),
      isCancelled: false,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().add(Duration(days: 1, hours: 3)),
      patient: Patient(
        id: 1,
        name: 'Jan',
        surname: 'Nowak',
        identityNumber: '97123093821',
      ),
      isCancelled: true,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().add(Duration(days: 1, hours: 1)),
      patient: Patient(
        id: 1,
        name: 'Krzyszłof',
        surname: 'Leszczyński',
        identityNumber: '84037483921',
      ),
      isCancelled: false,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().add(Duration(days: 1, hours: 2)),
      patient: Patient(
        id: 1,
        name: 'Jacek',
        surname: 'Młot',
        identityNumber: '42367898734',
      ),
      isCancelled: false,
      isFinished: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now().add(Duration(days: 1)),
      patient: Patient(
        id: 1,
        name: 'Jarosław',
        surname: 'Wiśniewski',
        identityNumber: '87023969483',
      ),
      isCancelled: false,
      isFinished: false,
    ),
  ];

  Icon getAppoitmentStatus(Appointment appointment) {
    if (appointment.isCancelled) {
      return Icon(
        Icons.cancel,
        color: Colors.red,
      );
    } else if (appointment.isFinished) {
      return Icon(
        Icons.check_box,
        color: Colors.green,
      );
    } else if (!appointment.isFinished &&
        !appointment.isCancelled &&
        appointment.wasYesterday()) {
      return Icon(
        Icons.timer_off,
        color: Colors.red,
      );
    } else {
      return Icon(Icons.access_time);
    }
  }

  List<Widget> mapToListTile(List<Appointment> appointments) {
    return appointments
        .map((appointment) => ListTile(
              leading: getAppoitmentStatus(appointment),
              title: Text(appointment.patient.fullName()),
              trailing: Text(appointment.prettyAppointmentDate()),
              subtitle: Text(appointment.patient.identityNumber),
            ))
        .toList();
  }

  List<Widget> getYesterdaysAppoitments() {
    return mapToListTile(_appointments
        .where((appointment) => appointment.wasYesterday())
        .toList());
  }

  List<Widget> getTodaysAppoitments() {
    return mapToListTile(
        _appointments.where((appointment) => appointment.isToday()).toList());
  }

  List<Widget> getTomorrowsAppoitments() {
    return mapToListTile(_appointments
        .where((appointment) => appointment.isTomorrow())
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    _appointments
        .sort((a, b) => a.appointmentDate.compareTo(b.appointmentDate));

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your appointments'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Yesterday'),
              Tab(text: 'Today'),
              Tab(text: 'Tomorrow'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: getYesterdaysAppoitments(),
              ).toList(),
            ),
            ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: getTodaysAppoitments(),
              ).toList(),
            ),
            ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: getTomorrowsAppoitments(),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
