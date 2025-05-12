import 'package:flutter/material.dart';
import 'package:flutter_ecomerce/widgets/user_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNavigationDrawer(),
      appBar: AppBar(title: const Text('Home Page'),),
    );
  }
}
