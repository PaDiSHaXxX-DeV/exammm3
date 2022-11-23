import 'package:exammm3/rout.dart';
import 'package:exammm3/screens/navigation_bar.dart';

import 'package:exammm3/screens/constant.dart';
import 'package:flutter/material.dart';
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
      title: 'Imtixon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavBar(),
      initialRoute: tabsRoute,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}