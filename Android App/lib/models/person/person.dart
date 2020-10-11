class Person {
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _socialID;
  String _email;
  int _age;

  Person(String firstName, String lastName, String phoneNumber, String socialID,
      String email, int age)
      : this._firstName = firstName,
        this._lastName = lastName,
        this._age = age,
        this._email = email,
        this._socialID = socialID,
        this._phoneNumber = phoneNumber;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  String get socialID => _socialID;
  String get email => _email;
  int get age => _age;

  set firstName(String firstName) => this._firstName = firstName;
  set lastName(String lastName) => this._lastName = lastName;
  set email(String email) => this._email = email;
  set phoneNumber(String phoneNumber) => this._phoneNumber = phoneNumber;
  set socialID(String socialID) => this._socialID = socialID;
  set age(int age) => this._age = age;
}