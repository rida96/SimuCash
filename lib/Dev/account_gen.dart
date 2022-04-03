import '../DB/drift_database.dart';

class Dev {

  static var count = 0;

  static var account = Account(
      cardID: 000000001,
      username: 'JohnDoe1',
      email: 'JohnDoe1@testmail.com',
      pw: 'TestPassword'
  );

  static var transaction = Transaction(
      transactionID: 000000000000001,
      cardID: 000000001,
      time: DateTime.parse('2022-01-22 10:12:05'),
      amount: 4530.05,
      //type: true,
      isValidated: true,
      isFinished: true
  );

  static var transaction2 = Transaction(
      transactionID: 000000000000002,
      cardID: 000000001,
      time: DateTime.parse('2022-02-03 20:18:04'),
      amount: 130.99*1.13,
      //type: false,
      isValidated: true,
      isFinished: true
  );

  static var transaction3 = Transaction(
      transactionID: 000000000000002,
      cardID: 000000001,
      time: DateTime.parse('2022-02-14 14:20:32'),
      amount: 200.99*1.13,
      //type: false,
      isValidated: true,
      isFinished: true);

  static var transaction4 = Transaction(
      transactionID: 000000000000002,
      cardID: 000000001,
      time: DateTime.parse('2022-02-28 13:00:00'),
      amount: 1040.72,
      //type: true,
      isValidated: true,
      isFinished: true);
}