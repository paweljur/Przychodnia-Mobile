class Patient {
  int id;
  String name;
  String surname;
  String identityNumber;

  Patient({this.id, this.identityNumber, this.name, this.surname});

  String fullName() {
    return '$name $surname';
  }
}
