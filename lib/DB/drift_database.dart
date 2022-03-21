/// //////////////////////
/// Database structure ///
/// ///////////////////////////////////////////////////////////////////////////////////////////////////////
/// Account table:
///              userID (primary key (HAS to be unique row-wise); used as pivot for user-card relation)
///               username (have min-heck; should have unique check)
///               email
///               pw (have min-check)
/// //////////////////////////////////////////////////////////////////////////////////////////////////////
/// Acs table: (account-cards relation in case multiple card per account)
///               cardID (primary key; used as pivot for card-transaction relation)
///               userID ()
/// //////////////////////////////////////////////////////////////////////////////////////////////////////
/// Transaction table:
///               Transaction ID (primary key)
///               cardID (background for now)
///               time
///               amount
///               type (use in UI to generate balance)
///               isValidated (background)
///               isFinished (background)
/// //////////////////////////////////////////////////////////////////////////////////////////////////////

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
//import 'package:moor/moor.dart';
//import 'package:moor_flutter/moor_flutter.dart';

part 'drift_database.g.dart';
//part 'moor_database.g.dart';

class Accounts extends Table {
  //by default, the column properties with the autoIncrement sub-function is set as primary key
  IntColumn get cardID => integer()();
  // IntColumn get userID => integer()();
  //can set length constrain like below; separate parameters with comma
  TextColumn get username => text().withLength(min: 1)();
  TextColumn get email => text()();
  TextColumn get pw => text().withLength(min: 8)();

  @override
  Set<Column> get primaryKey => {cardID};
}

/*//if each user can only have 1 account, this table and related DAO can be deleted
class Acs extends Table {
  IntColumn get cardID => integer()();
  //add below to userID as custom constraint in case if card without account is allowed
  //integer().nullable().customConstraint('NULL REFERENCES accounts(userID)')
  IntColumn get userID => integer()();

  // override for primary key can be done like (when auto increment isn't implemented for w/e reason)
  @override
  Set<Column> get primaryKey => {cardID};
}*/

class Transactions extends Table {
  IntColumn get transactionID => integer().autoIncrement()();
  IntColumn get cardID => integer()();
  //IntColumn get cardID => integer().nullable().references(Accounts, #cardID)();
  DateTimeColumn get time => dateTime()();
  RealColumn get amount => real()();
  // for type, true is debit and false is credit
  //BoolColumn get type => boolean().withDefault(const Constant(true))();
  BoolColumn get isValidated => boolean().withDefault(const Constant(false))();
  BoolColumn get isFinished => boolean().withDefault(const Constant(false))();
}
class CardTransaction{
  final DateTime time;
  final double amount;

  CardTransaction(this.time, this.amount);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
//@UseMoor
@DriftDatabase(
    tables: [Accounts,  Transactions],
)

// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(_openConnection());

/*  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    logStatements: true,
  )));*/

  /// db migration can be done here; not implemented yet/still need to learn if needed
  @override
  int get schemaVersion => 1;

  get time => null;

  get amount => null;


  //
  // login related
  //
  //for forgot password, we can do username check, and if its valid, pull user info (presumably email) using loggedInUserInfo
  Future<Expression<bool>> usernameExists(String uname) async {
    return existsQuery(
        select(accounts)..where((row) => row.username.equals(uname)));
  }

  Future<Expression<bool>> cardExists(int cardID) async{
    return existsQuery(
        select(accounts)..where((row) => row.cardID.equals(cardID)));
  }

  Future<Expression<bool>> passwordCorrect(String uname, String password) async{
    //can cascade multiple where()s like below
    return existsQuery(select(accounts)
      ..where((row) => row.username.equals(uname))
      ..where((row) => row.pw.equals(password)));
  }

  //need to pull userID from the row/table generated from this in UI and pass onto home_page
  Future<Account> loggedInUserInfo(String uname) {
    return (select(accounts)..where((row) => row.username.equals(uname)))
        .getSingle();
  }

  String loggedInUserCardID(String uname){
    return customSelect(
        //query works fine
        //'SELECT * FROM books;',
        'SELECT cardID FROM Accounts WHERE username = ?',
        variables: [Variable.withString(uname)],
    ).toString();
  }
  // presumably superuser/admin stuff
  Future<List<Account>> getAllAccounts() => select(accounts).get();

  Stream<List<Account>> watchAllAccounts() => select(accounts).watch();
  /*Stream<Account> watchAccountByID(int id) {
    return (select(accounts)..where((t) => t.userID.equals(id))).watchSingle();
  }*/

  Future insertAccount(Insertable<Account> account) =>
      into(accounts).insert(account);
  Future updateAccount(Insertable<Account> account) =>
      update(accounts).replace(account);
  Future deleteAccount(Insertable<Account> account) =>
      delete(accounts).delete(account);


  /*Future<Ac> loggedInUserCard(int uID) {
    return (select(acs)..where((row) => row.userID.equals(uID))).getSingle();
  }

  // presumably superuser/admin stuff
  Future<List<Ac>> getAllACs() => select(acs).get();

  Stream<List<Ac>> watchAllACs() => select(acs).watch();
  Stream<List<Ac>> watchUserACs(int id) {
    return (select(acs)..where((row) => row.userID.equals(id))).watch();
  }

  Future insertAcs(Insertable<Ac> ac) => into(acs).insert(ac);
  Future updateAcs(Insertable<Ac> ac) => update(acs).replace(ac);
  Future deleteAcs(Insertable<Ac> ac) => delete(acs).delete(ac);*/

  Stream<List<CardTransaction>> watchCardTransactions(int cardID) {
    return customSelect(
      //query works fine
      //'SELECT * FROM books;',
        'SELECT time, amount FROM Transaction WHERE Transaction.cardID = ?',
      variables: [Variable.withInt(cardID)],
    ).watch().map((rows){
      return rows
          //TODO need to fix this part (need to figure out how to pull out amount and time columns from the query to enter into the list's rows
          .map((row) => CardTransaction(time.fromData(row.data, this), amount.fromData(row.data, this)))
          .toList();
    });
  }

/*  Stream<List<Transaction>> watchCardTransactions(int cardID) {
    return (select(transactions)
      ..where((row) => row.cardID.equals(cardID))
      ..orderBy([
            (row) => OrderingTerm(expression: row.time, mode: OrderingMode.asc)
      ]))
        .watch();
  }*/

  String cardBalance(int cardID){
    return customSelect(
      //query works fine
      //'SELECT * FROM books;',
      'SELECT SUM(amount) FROM [Transactions] WHERE card = ?;',
      variables: [Variable.withInt(cardID)],
    ).toString();
  }

  String highest_transactionID(int cardID){
    return customSelect(
      //query works fine
      //'SELECT * FROM books;',
      'SELECT MAX(transactionID) FROM Transactions WHERE cardID = ?;',
      variables: [Variable.withInt(cardID)],
    ).toString();
  }

  //Presumably super user stuff
  Future<List<Transaction>> getAllTransactions() => select(transactions).get();

  Stream<List<Transaction>> watchAllTransactions() =>
      select(transactions).watch();

  /// for transferring and receiving funds, can use the below (specify type parameter depending on which one
  /// is being done) and play around with validation and finish parameter?
  Future insertTransactions(Insertable<Transaction> transaction) =>
      into(transactions).insert(transaction);
  Future updateTransactions(Insertable<Transaction> transaction) =>
      update(transactions).replace(transaction);
  Future deleteTransactions(Insertable<Transaction> transaction) =>
      delete(transactions).delete(transaction);
}

/*@UseDao(tables: [Accounts])
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AccountDao(this.db) : super(db);

  //
  // login related
  //
  //for forgot password, we can do username check, and if its valid, pull user info (presumably email) using loggedInUserInfo
  usernameExists(String uname) {
    return existsQuery(
        select(accounts)..where((row) => row.username.equals(uname)));
  }

  passwordCorrect(String uname, String password) {
    //can cascade multiple where()s like below
    return existsQuery(select(accounts)
      ..where((row) => row.username.equals(uname))
      ..where((row) => row.pw.equals(password)));
  }

  //need to pull userID from the row/table generated from this in UI and pass onto home_page
  Future<Account> loggedInUserInfo(String uname) {
    return (select(accounts)..where((row) => row.username.equals(uname)))
        .getSingle();
  }

  // presumably superuser/admin stuff
  Future<List<Account>> getAllAccounts() => select(accounts).get();

  Stream<List<Account>> watchAllAccounts() => select(accounts).watch();
  Stream<Account> watchAccountByID(int id) {
    return (select(accounts)..where((t) => t.userID.equals(id))).watchSingle();
  }

  Future insertAccount(Insertable<Account> account) =>
      into(accounts).insert(account);
  Future updateAccount(Insertable<Account> account) =>
      update(accounts).replace(account);
  Future deleteAccount(Insertable<Account> account) =>
      delete(accounts).delete(account);
}

@UseDao(tables: [Acs, Transactions])
class AcDao extends DatabaseAccessor<AppDatabase> with _$AcDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  AcDao(this.db) : super(db);

  //pull card ID from what is generated here in UI
  Future<Ac> loggedInUserCard(int uID) {
    return (select(acs)..where((row) => row.userID.equals(uID))).getSingle();
  }

  // presumably superuser/admin stuff
  Future<List<Ac>> getAllACs() => select(acs).get();

  Stream<List<Ac>> watchAllACs() => select(acs).watch();
  Stream<List<Ac>> watchUserACs(int id) {
    return (select(acs)..where((row) => row.userID.equals(id))).watch();
  }

  Future insertAcs(Insertable<Ac> ac) => into(acs).insert(ac);
  Future updateAcs(Insertable<Ac> ac) => update(acs).replace(ac);
  Future deleteAcs(Insertable<Ac> ac) => delete(acs).delete(ac);
}

@UseDao(tables: [Transactions])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  TransactionDao(this.db) : super(db);

  //User this to get user's card's data to populate user page in UI
  Stream<List<Transaction>> watchCardTransactions(int cardID) {
    return (select(transactions)
          ..where((row) => row.cardID.equals(cardID))
          ..orderBy([
            (row) => OrderingTerm(expression: row.time, mode: OrderingMode.asc)
          ]))
        .watch();
  }

  //Presumably super user stuff
  Future<List<Transaction>> getAllTransactions() => select(transactions).get();

  Stream<List<Transaction>> watchAllTransactions() =>
      select(transactions).watch();

  /// for transferring and receiving funds, can use the below (specify type parameter depending on which one
  /// is being done) and play around with validation and finish parameter?
  Future insertTransactions(Insertable<Transaction> transaction) =>
      into(transactions).insert(transaction);
  Future updateTransactions(Insertable<Transaction> transaction) =>
      update(transactions).replace(transaction);
  Future deleteTransactions(Insertable<Transaction> transaction) =>
      delete(transactions).delete(transaction);
}*/
