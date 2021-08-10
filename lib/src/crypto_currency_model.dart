class CryptoCurrencyModel {
  final String symbol;
  final String name;
  final double price;

  CryptoCurrencyModel({
    required this.symbol,
    required this.name,
    required this.price,
  });

  factory CryptoCurrencyModel.fromJson(Map<String, dynamic> data) {
    String symbol = data['symbol'];
    String name = data['name'];
    double price = data['metrics']['market_data']['price_usd'];

    return CryptoCurrencyModel(
      symbol: symbol,
      name: name,
      price: price,
    );
  }
}
