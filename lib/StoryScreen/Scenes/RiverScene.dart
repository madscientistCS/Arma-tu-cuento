import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';

import 'package:arma_tu_cuento/StoryScreen/Scenes/RiverWoodScene.dart';
import 'package:get/get.dart';

class RiverScene extends StatefulWidget {
  RiverScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RiverSceneState createState() => _RiverSceneState();
}

class _RiverSceneState extends State<RiverScene> {
  final Map choices = {
    ConstantsImages.img_ball: Colors.green,
    ConstantsImages.img_bottle: Colors.yellow,
    ConstantsImages.img_wood: Colors.red,
  };

  bool accepted = false;

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
                    imagePath: character.img_character),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ContainerImage(
                    width: 110,
                    height: 140,
                    imagePath: ConstantsImages.img_sonder),
              ),
              Positioned(
                left: 30,
                bottom: 170,
                child: Container(
                  width: 300,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 25,
                bottom: 190,
                child: accepted
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: choices.keys.map((images) {
                          return Draggable<String>(
                            data: images,
                            child: FeedbackContainerImage(
                              width: 100,
                              height: 65,
                              imagePath: images,
                            ), // user's wiew when they're not hace interactions
                            feedback: FeedbackContainerImage(
                              width: 100,
                              height: 65,
                              imagePath: images,
                            ), // when the user start to drag
                            childWhenDragging:
                                Container(), // when//display the original child when it's being dragged now
                          );
                        }).toList()),
              ),
              Positioned(
                bottom: 30,
                left: 280,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return FeedbackContainerImage(
                      width: 160,
                      height: 120,
                      imagePath: ConstantsImages.gif_red_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == ConstantsImages.img_wood) {
                      setState(() {
                        Get.to(RiverWoodScene());
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ejemplo para mover objetos
//Positioned(
//                top: 50,
//                bottom: 150,
//                child: accepted
//                    ? Container()
//                    : Draggable(
//                        feedback: Container(
//                          color: Colors.blue[100],
//                          width: 100,
//                          height: 100,
//                        ),
//                        child: Container(
//                          color: Colors.blue,
//                          height: 100,
//                          width: 100,
//                        ),
//                        childWhenDragging: Container(),
//                        data: "kotak",
//                      ),
//              ),
//              Positioned(
//                top: 100,
//                left: 400,
//                child: DragTarget(
//                  builder: (context, List<String> data, rj) {
//                    return Container(
//                      color: warnaBg,
//                      width: 100,
//                      height: 100,
//                    );
//                  },
//                  onAccept: (data) {
//                    if (data == 'kotak') {
//                      setState(() {
//                        warnaBg = Colors.blue[700];
//                        accepted = true;
//                      });
//                    }
//                  },
//                ),
//              ),
