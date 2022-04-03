// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Account extends DataClass implements Insertable<Account> {
  final int cardID;
  final String username;
  final String email;
  final String pw;
  Account(
      {required this.cardID,
      required this.username,
      required this.email,
      required this.pw});
  factory Account.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Account(
      cardID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_i_d'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      pw: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pw'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_i_d'] = Variable<int>(cardID);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['pw'] = Variable<String>(pw);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      cardID: Value(cardID),
      username: Value(username),
      email: Value(email),
      pw: Value(pw),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      cardID: serializer.fromJson<int>(json['cardID']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      pw: serializer.fromJson<String>(json['pw']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardID': serializer.toJson<int>(cardID),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'pw': serializer.toJson<String>(pw),
    };
  }

  Account copyWith(
          {int? cardID, String? username, String? email, String? pw}) =>
      Account(
        cardID: cardID ?? this.cardID,
        username: username ?? this.username,
        email: email ?? this.email,
        pw: pw ?? this.pw,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('cardID: $cardID, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('pw: $pw')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cardID, username, email, pw);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.cardID == this.cardID &&
          other.username == this.username &&
          other.email == this.email &&
          other.pw == this.pw);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> cardID;
  final Value<String> username;
  final Value<String> email;
  final Value<String> pw;
  const AccountsCompanion({
    this.cardID = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.pw = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.cardID = const Value.absent(),
    required String username,
    required String email,
    required String pw,
  })  : username = Value(username),
        email = Value(email),
        pw = Value(pw);
  static Insertable<Account> custom({
    Expression<int>? cardID,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? pw,
  }) {
    return RawValuesInsertable({
      if (cardID != null) 'card_i_d': cardID,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (pw != null) 'pw': pw,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? cardID,
      Value<String>? username,
      Value<String>? email,
      Value<String>? pw}) {
    return AccountsCompanion(
      cardID: cardID ?? this.cardID,
      username: username ?? this.username,
      email: email ?? this.email,
      pw: pw ?? this.pw,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardID.present) {
      map['card_i_d'] = Variable<int>(cardID.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (pw.present) {
      map['pw'] = Variable<String>(pw.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('cardID: $cardID, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('pw: $pw')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _cardIDMeta = const VerificationMeta('cardID');
  @override
  late final GeneratedColumn<int?> cardID = GeneratedColumn<int?>(
      'card_i_d', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username =
      GeneratedColumn<String?>('username', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pwMeta = const VerificationMeta('pw');
  @override
  late final GeneratedColumn<String?> pw =
      GeneratedColumn<String?>('pw', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 8,
          ),
          type: const StringType(),
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [cardID, username, email, pw];
  @override
  String get aliasedName => _alias ?? 'accounts';
  @override
  String get actualTableName => 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_i_d')) {
      context.handle(_cardIDMeta,
          cardID.isAcceptableOrUnknown(data['card_i_d']!, _cardIDMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('pw')) {
      context.handle(_pwMeta, pw.isAcceptableOrUnknown(data['pw']!, _pwMeta));
    } else if (isInserting) {
      context.missing(_pwMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cardID};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Account.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int transactionID;
  final int cardID;
  final DateTime time;
  final double amount;
  final bool isValidated;
  final bool isFinished;
  Transaction(
      {required this.transactionID,
      required this.cardID,
      required this.time,
      required this.amount,
      required this.isValidated,
      required this.isFinished});
  factory Transaction.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Transaction(
      transactionID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_i_d'])!,
      cardID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_i_d'])!,
      time: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      isValidated: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_validated'])!,
      isFinished: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_finished'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_i_d'] = Variable<int>(transactionID);
    map['card_i_d'] = Variable<int>(cardID);
    map['time'] = Variable<DateTime>(time);
    map['amount'] = Variable<double>(amount);
    map['is_validated'] = Variable<bool>(isValidated);
    map['is_finished'] = Variable<bool>(isFinished);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      transactionID: Value(transactionID),
      cardID: Value(cardID),
      time: Value(time),
      amount: Value(amount),
      isValidated: Value(isValidated),
      isFinished: Value(isFinished),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      transactionID: serializer.fromJson<int>(json['transactionID']),
      cardID: serializer.fromJson<int>(json['cardID']),
      time: serializer.fromJson<DateTime>(json['time']),
      amount: serializer.fromJson<double>(json['amount']),
      isValidated: serializer.fromJson<bool>(json['isValidated']),
      isFinished: serializer.fromJson<bool>(json['isFinished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionID': serializer.toJson<int>(transactionID),
      'cardID': serializer.toJson<int>(cardID),
      'time': serializer.toJson<DateTime>(time),
      'amount': serializer.toJson<double>(amount),
      'isValidated': serializer.toJson<bool>(isValidated),
      'isFinished': serializer.toJson<bool>(isFinished),
    };
  }

  Transaction copyWith(
          {int? transactionID,
          int? cardID,
          DateTime? time,
          double? amount,
          bool? isValidated,
          bool? isFinished}) =>
      Transaction(
        transactionID: transactionID ?? this.transactionID,
        cardID: cardID ?? this.cardID,
        time: time ?? this.time,
        amount: amount ?? this.amount,
        isValidated: isValidated ?? this.isValidated,
        isFinished: isFinished ?? this.isFinished,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('transactionID: $transactionID, ')
          ..write('cardID: $cardID, ')
          ..write('time: $time, ')
          ..write('amount: $amount, ')
          ..write('isValidated: $isValidated, ')
          ..write('isFinished: $isFinished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(transactionID, cardID, time, amount, isValidated, isFinished);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.transactionID == this.transactionID &&
          other.cardID == this.cardID &&
          other.time == this.time &&
          other.amount == this.amount &&
          other.isValidated == this.isValidated &&
          other.isFinished == this.isFinished);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> transactionID;
  final Value<int> cardID;
  final Value<DateTime> time;
  final Value<double> amount;
  final Value<bool> isValidated;
  final Value<bool> isFinished;
  const TransactionsCompanion({
    this.transactionID = const Value.absent(),
    this.cardID = const Value.absent(),
    this.time = const Value.absent(),
    this.amount = const Value.absent(),
    this.isValidated = const Value.absent(),
    this.isFinished = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.transactionID = const Value.absent(),
    required int cardID,
    required DateTime time,
    required double amount,
    this.isValidated = const Value.absent(),
    this.isFinished = const Value.absent(),
  })  : cardID = Value(cardID),
        time = Value(time),
        amount = Value(amount);
  static Insertable<Transaction> custom({
    Expression<int>? transactionID,
    Expression<int>? cardID,
    Expression<DateTime>? time,
    Expression<double>? amount,
    Expression<bool>? isValidated,
    Expression<bool>? isFinished,
  }) {
    return RawValuesInsertable({
      if (transactionID != null) 'transaction_i_d': transactionID,
      if (cardID != null) 'card_i_d': cardID,
      if (time != null) 'time': time,
      if (amount != null) 'amount': amount,
      if (isValidated != null) 'is_validated': isValidated,
      if (isFinished != null) 'is_finished': isFinished,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? transactionID,
      Value<int>? cardID,
      Value<DateTime>? time,
      Value<double>? amount,
      Value<bool>? isValidated,
      Value<bool>? isFinished}) {
    return TransactionsCompanion(
      transactionID: transactionID ?? this.transactionID,
      cardID: cardID ?? this.cardID,
      time: time ?? this.time,
      amount: amount ?? this.amount,
      isValidated: isValidated ?? this.isValidated,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionID.present) {
      map['transaction_i_d'] = Variable<int>(transactionID.value);
    }
    if (cardID.present) {
      map['card_i_d'] = Variable<int>(cardID.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (isValidated.present) {
      map['is_validated'] = Variable<bool>(isValidated.value);
    }
    if (isFinished.present) {
      map['is_finished'] = Variable<bool>(isFinished.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('transactionID: $transactionID, ')
          ..write('cardID: $cardID, ')
          ..write('time: $time, ')
          ..write('amount: $amount, ')
          ..write('isValidated: $isValidated, ')
          ..write('isFinished: $isFinished')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _transactionIDMeta =
      const VerificationMeta('transactionID');
  @override
  late final GeneratedColumn<int?> transactionID = GeneratedColumn<int?>(
      'transaction_i_d', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _cardIDMeta = const VerificationMeta('cardID');
  @override
  late final GeneratedColumn<int?> cardID = GeneratedColumn<int?>(
      'card_i_d', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime?> time = GeneratedColumn<DateTime?>(
      'time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _isValidatedMeta =
      const VerificationMeta('isValidated');
  @override
  late final GeneratedColumn<bool?> isValidated = GeneratedColumn<bool?>(
      'is_validated', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_validated IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isFinishedMeta = const VerificationMeta('isFinished');
  @override
  late final GeneratedColumn<bool?> isFinished = GeneratedColumn<bool?>(
      'is_finished', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_finished IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [transactionID, cardID, time, amount, isValidated, isFinished];
  @override
  String get aliasedName => _alias ?? 'transactions';
  @override
  String get actualTableName => 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_i_d')) {
      context.handle(
          _transactionIDMeta,
          transactionID.isAcceptableOrUnknown(
              data['transaction_i_d']!, _transactionIDMeta));
    }
    if (data.containsKey('card_i_d')) {
      context.handle(_cardIDMeta,
          cardID.isAcceptableOrUnknown(data['card_i_d']!, _cardIDMeta));
    } else if (isInserting) {
      context.missing(_cardIDMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('is_validated')) {
      context.handle(
          _isValidatedMeta,
          isValidated.isAcceptableOrUnknown(
              data['is_validated']!, _isValidatedMeta));
    }
    if (data.containsKey('is_finished')) {
      context.handle(
          _isFinishedMeta,
          isFinished.isAcceptableOrUnknown(
              data['is_finished']!, _isFinishedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionID};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Transaction.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [accounts, transactions];
}
