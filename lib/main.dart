import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazday_kuliner/data/repository/user_repository.dart';
import 'package:lazday_kuliner/modul/base/base_home_view.dart';

void main() {
  runApp(const KulinerApp());
}

class KulinerApp extends StatelessWidget {
  const KulinerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kuliner',
        theme: ThemeData(
            primarySwatch: Colors.pink, canvasColor: Colors.transparent),
        home: const BaseHomeView(),
      ),
    );
  }
}
