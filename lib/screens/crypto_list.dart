import 'package:cryptocurrency/bloc/crypto_bloc.dart';
import 'package:cryptocurrency/bloc/crypto_event.dart';
import 'package:cryptocurrency/bloc/crypto_state.dart';
import 'package:cryptocurrency/repo/crypto_repo.dart';
import 'package:cryptocurrency/src/crypto_currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  _CryptoListScreenState createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  bool byName = false;

  @override
  void initState() {
    super.initState();

    context.read<CryptoBloc>().add(FetchInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Crypto List'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                byName = !byName;
              });
            },
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          if (state is IsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is IsNotLoaded) {
            return AlertDialog(
              title: const Text("Error occured"),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<CryptoBloc>().add(FetchInfo());
                  },
                  child: const Text('Try again'),
                ),
              ],
              elevation: 5,
            );
          } else if (state is IsLoaded) {
            List<CryptoCurrencyModel> list = state.getResult;

            if (byName) {
              list.sort((a, b) => a.name.compareTo(b.name));
            } else {
              list.sort((a, b) => b.price.compareTo(a.price));
            }

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list[index].name),
                  subtitle: Text(
                    list[index].symbol +
                        " --- " +
                        double.parse((list[index].price).toStringAsFixed(2))
                            .toString(),
                  ),
                  isThreeLine: true,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
