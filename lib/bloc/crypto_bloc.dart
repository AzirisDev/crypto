
import 'package:cryptocurrency/bloc/crypto_event.dart';
import 'package:cryptocurrency/bloc/crypto_state.dart';
import 'package:cryptocurrency/repo/crypto_repo.dart';
import 'package:cryptocurrency/src/crypto_currency_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoRepository cryptoRepo;

  CryptoBloc(this.cryptoRepo) : super(InitialState());

  @override
  Stream<CryptoState> mapEventToState(CryptoEvent event) async* {
    if (event is FetchInfo) {
      yield IsLoading();
      try {
        List<CryptoCurrencyModel> list = await cryptoRepo.getList();
        // for Alert Dialog check
        // throw Error();
        yield IsLoaded(list);
      } catch (_) {
        yield IsNotLoaded();
      }
    } else {
      yield InitialState();
    }
  }
}
