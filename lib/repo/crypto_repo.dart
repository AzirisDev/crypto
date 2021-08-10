import 'package:cryptocurrency/src/crypto_currency_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoRepository {
  Future<List<CryptoCurrencyModel>> getList() async {
    final data = await http.Client()
        .get(Uri.parse('https://data.messari.io/api/v1/assets'));

    if (data.statusCode != 200) {
      print('error');
      throw Exception();
    }

    return parsedJson(data.body);
  }
}

List<CryptoCurrencyModel> parsedJson(final data) {

final jsonDecodedList = json.decode(data);

  List<CryptoCurrencyModel> result = [];
  for (Map<String, dynamic> crypto in jsonDecodedList['data']) {
    CryptoCurrencyModel newCrypto = CryptoCurrencyModel.fromJson(crypto);
    result.add(newCrypto);
  }

  return result;
}
