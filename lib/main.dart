import 'package:flutter/material.dart';
import 'package:formem/pages/add_formular.dart';
import 'package:formem/pages/home.dart';
import 'package:go_router/go_router.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }

  // GoRouter router = GoRouter(routes: [
  //   GoRoute(path: '/', builder: (context, state) => HomePage()),
  //   GoRoute(path: '/addformular', builder: (context, state) => AddFormula())
  // ]);
}
