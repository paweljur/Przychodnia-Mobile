import 'package:flutter/material.dart';
import 'package:przychodnia_mobile/models/patient.dart';
import 'package:przychodnia_mobile/models/appointment.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List<Appointment> appointments = [
    Appointment(
      id: 1,
      appointmentDate: DateTime.now(),
      patient: Patient(
        id: 1,
        name: 'Adam',
        surname: 'Savage',
        identityNumber: '123123123123',
      ),
      isCancelled: false,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now(),
      patient: Patient(
        id: 1,
        name: 'Adam',
        surname: 'Savage',
        identityNumber: '123123123123',
      ),
      isCancelled: true,
    ),
    Appointment(
      id: 1,
      appointmentDate: DateTime.now(),
      patient: Patient(
        id: 1,
        name: 'Adam',
        surname: 'Savage',
        identityNumber: '123123123123',
      ),
      isCancelled: false,
    ),
  ];

  List<Widget> getAppoitmentTiles() {
    return appointments
        .map((appointment) => ListTile(
              leading: Icon(Icons.access_time),
              title: Text(
                  '${appointment.patient.name} ${appointment.patient.surname}'),
              trailing: Text('${appointment.appointmentDate.toString()}'),
              enabled: !appointment.isCancelled,
              subtitle: Text(appointment.patient.identityNumber),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your appointments'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: getAppoitmentTiles(),
        ).toList(),
      ),
    );
  }
}
