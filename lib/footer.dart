import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';



import 'coolors.dart';
import 'header.dart';
import 'package:velocity_x/velocity_x.dart';


final List<String> imgList = [
  "assets/img/wbcsd.png",
  "assets/img/1percent.jpg",
  'assets/img/350.png',
  'assets/img/acumen.png',
  'assets/img/AfDB.png',
  'assets/img/bankofindustry.png',
  'assets/img/USAID.png',
  'assets/img/basd.png',
  'assets/img/ceres.png',
  'assets/img/climateaction.png',
  'assets/img/energy-coalliion.png',
  'assets/img/energy-in-common.png',
  'assets/img/gef.png',
  'assets/img/reeep.png',
  'assets/img/riosocial.png',
  'assets/img/smallworld.png',
  'assets/img/gef-ngo.png',
  'assets/img/global-alliance-for-clean.png',
];

class FooterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [

              "OUR MISSION"
                  .text
                  .color(Coolors.accentColor)
                  .semiBold
                  .make()
                  .box
                  .border(color: Coolors.accentColor)
                  .p16
                  .rounded
                  .make(),
              10.heightBox,

              "The Leading Provider of Increased Access to Finance,"
                  " Renewable Energy, Affordable Housing, Food Security and "
                  "Technology Services to the Disadvantaged Low-Income Individuals.".text.center.green600.xl.make(),

            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [

              "OUR MISSION"
                  .text
                  .color(Coolors.accentColor)
                  .semiBold
                  .make()
                  .box
                  .border(color: Coolors.accentColor)
                  .p16
                  .rounded
                  .make(),
              10.widthBox,
              "The Leading Provider of Increased Access to Finance,"
                  " Renewable Energy, Affordable Housing, Food Security and "
                  "Technology Services to the Disadvantaged Low-Income Individuals.".text.center.green600.xl.make(),
            ],
            alignment: MainAxisAlignment.spaceAround,
          ).w(context.safePercentWidth * 70).scale150().p16(),
        ),
        50.heightBox,
        Partners(),
        30.heightBox,
        CustomAppBar(),
        5.heightBox,

            "To be a Social Enterprise of reference in Africa.".text.gray500.make(),

        10.heightBox,
        SocialAccounts(),
        30.heightBox,
        [

          10.widthBox,
          Icon(
            AntDesign.copyright,
            color: Vx.red500,
            size: 14,
          ),

          " Smefunds Limited".text.orange600.make(),
        ].hStack(crossAlignment: CrossAxisAlignment.center)
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}

final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(10, 0, 5, 0),
                      Color.fromARGB(0, 5, 0, 10)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

              ),
            ),
          ],
        )
    ),
  ),
)).toList();




class Partners extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PartnersState();
  }
}

class _PartnersState extends State<Partners> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return  (
      // appBar: AppBar(title: Text('Carousel with indicator demo')),
       Column(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 5.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ]
      )
    );
  }
}
