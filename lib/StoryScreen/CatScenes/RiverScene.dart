import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/BottomButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/CityNightScene.dart';
import 'package:get/get.dart';

class RiverScene extends StatefulWidget {
  RiverScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RiverSceneState createState() => _RiverSceneState();
}

class _RiverSceneState extends State<RiverScene> {
  @override
  Widget build(BuildContext context) {
    double widthScreen;
    double heightScreen;
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[
          MainBackground(
            widthScreen: widthScreen,
            heightScreen: heightScreen,
            imagePath: 'assets/Scenes/river.png',
          ),
          TopButtons(),
          Positioned(
              left: 100,
              bottom: 5,
              child: ContainerImage(
                  width: 120,
                  height: 120,
                  imagePath: 'assets/Characters/felix_run1.png')),
          Positioned(
              right: 100,
              bottom: 5,
              child: ContainerImage(
                  width: 90,
                  height: 120,
                  imagePath: 'assets/Characters/sonder_run2.png')),
          BottomButtons(), // el botton sig esta comentado porque debe ser dimamico
          Positioned(
            right: 250,
            child: IconButton(
              // el boton debe dar a la siguiente pantalla
              icon: Icon(Icons.navigate_next),
              color: Colors.blue,
              iconSize: 80,
              onPressed: () {},
            ),
          ),
        ],
      ))),
    );
  }
}
