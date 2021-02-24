import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';


import 'coolors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameWidget = "SME \n      Funds."
        .text
        .white
        .xl5
        .lineHeight(1)
        .size(context.isMobile ? 5 : 10)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
          child: VStack([
            ZStack(
              [
                PictureWidget(),
                Row(
                  children: [
                    VStack([
                      if (context.isMobile) 50.heightBox else 10.heightBox,
                      CustomAppBar().shimmer(primaryColor: Coolors.accentColor),
                      40.heightBox,
                      nameWidget,
                      40.heightBox,
                      VxBox()
                          .color(Coolors.accentColor)
                          .size(60, 10)
                          .make()
                          .px4()
                          .shimmer(primaryColor: Coolors.accentColor),
                      60.heightBox,
                      SocialAccounts(),
                    ]).pSymmetric(
                      h: context.percentWidth * 20,
                      v: 32,
                    ),

                  ],
                ).w(context.screenWidth)
              ],
            )
          ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // return Icon(
    return   Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
        height: context.percentHeight * 6,
      // ),
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      origin: Offset(context.percentWidth * 0, 0),
      transform: Matrix4.rotationY(pi),
      child: ImageSlideshow(
        width: double.infinity,
        height: 400,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        children: [
          Image.asset(
            'assets/images/biodiesel.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/solar.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/happy-family.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/pollution.jpg',
            fit: BoxFit.cover,

          ),
        ],
        onPageChanged: (value) {
          print('Page changed: $value');
        },

    ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.orangeAccent,
      ).mdClick(() {
        launch("https://twitter.com/smefunds");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.facebook_square,
        color: Colors.orangeAccent,
      ).mdClick(() {
        launch("https://facebook.com/SMEFUNDS");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.linkedin_square,
        color: Colors.orangeAccent,
      ).mdClick(() {
        launch("https://linkedIn.com/#");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.medium_monogram,
        color: Colors.orangeAccent,
      ).mdClick(() {
        launch("https://medium.com/@smefunds");
      }).make()
    ].hStack();
  }
}

