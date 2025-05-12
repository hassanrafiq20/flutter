import 'package:flutter/material.dart';
import 'package:flutter_ecomerce/widgets/user_drawer.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});
  static const String routeName = '/AboutUsPage';

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNavigationDrawer(),
      appBar: AppBar(title: Text('About Us'),),
    );
  }
}