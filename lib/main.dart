import 'package:cryptocurrency/bloc/crypto_bloc.dart';
import 'package:cryptocurrency/repo/crypto_repo.dart';
import 'package:cryptocurrency/screens/crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CryptoBloc(CryptoRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CryptoList',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CryptoListScreen(),
      ),
    );
  }
}
