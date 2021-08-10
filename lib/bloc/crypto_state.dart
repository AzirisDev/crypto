import 'package:cryptocurrency/src/crypto_currency_model.dart';
import 'package:equatable/equatable.dart';

class CryptoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends CryptoState{}

class IsLoading extends CryptoState {}

class IsNotLoaded extends CryptoState {}

class IsLoaded extends CryptoState {
  final List<CryptoCurrencyModel> _result;

  IsLoaded(this._result);

  List<CryptoCurrencyModel> get getResult => _result;

  @override
  List<Object?> get props => [_result];
}
