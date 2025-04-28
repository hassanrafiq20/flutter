import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_ecomerce/screens/home_page.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late int counter = 0;
  Random rnd = Random();
  late String saying = '';

  List<String> sayings = [
    "#Markhor🦌",
    "#MeTheLoneWolf🐺",
    "#thuglife☠️👽⚔️🔪⛓",
    "#nothingbox🙇🤷🏽‍♂️🕸🎁",
    "#hakunamatata🐅",
    "#maulahjat🏋🏾‍⚔",
    "#deadman💀⚰️",
    "#deadwillriseagain⚔",
    "#istandalone👑",
    "#istandaloneforjustic🐅☘️",
    "#nøfate⚓️🚀⚰️",
    "#bornfreeandwild👅💪",
    "#bornfreeandlivefree🐅🐆🐈",
    "#brutaltactician🎖",
    "#holysinner🕊",
    "#devilhunter😇",
    "#khalaimakhlooq👻☠️😈🦅👽",
    "#aakhrichittan👻🚶🏽‍♂️🦁🐆🐅🌊🧗🏼‍♂️🥇🎖🏆🗻",
    "#KoiJalGiaKisiNayDuaDi👤🔥🎃☠️🤯😇🙏📦",
    "#ZakhmiDillJallaDon🤦🏻‍♂️🤕🔥💔👿☠️👻",
    "#WhatHappensToTheSoulsWhoLookInTheEyesOfDragon🦖🐉☃️🌊⛈💥🔥🌪🐲☠️👻",
  ];

  void loadingStatus() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      setState(() {
        counter = counter + 25;
        saying = sayings[rnd.nextInt(13)];
      });
      loadingStatus();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingStatus();
    Timer(
      const Duration(seconds: 4),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/media/backgrounds/phoenix_02.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200, // ← desired card width
                // height: 180, // ← desired card height
                child: Card(
                  elevation: 10,
                  color: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.min, // shrink‐to‐fit vertically
                      children: [

                        const SizedBox(height: 10),
                        // ← This is your Text element with overflow handling:
                        Text(
                          '$counter %',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 10),
                        const CircularProgressIndicator(
                          backgroundColor: Colors.yellow,
                        ),
                        const SizedBox(height: 10,),
                        Flexible(
                          child: Text(
                            saying,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2, // limit to 2 lines
                            overflow:
                            TextOverflow.ellipsis, // show “…” if too long
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
