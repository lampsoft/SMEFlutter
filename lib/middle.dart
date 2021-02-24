import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.green600,
      child: Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            "Our Innovate\n"
                .richText
                .withTextSpanChildren(
                ["   Solutions.".textSpan.yellow500.make()])
                .xl4
                .white
                .make(),
            20.widthBox,
            Expanded(
                child: VxSwiper(
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  items: [
                    ProjectWidget(title: "Green Fellowship"),
                    ProjectWidget(title: "OneWatt Solar"),
                    ProjectWidget(title: "Climate Finance"),
                    ProjectWidget(title: "GoSolar Africa"),
                    ProjectWidget(title: "GE Biofuels"),

                    ProjectWidget(title: "GreenMarket Africa"),
                    ProjectWidget(title: "KikeGreen Stoves"),
                    ProjectWidget(title: "Carbon Exchange"),
                  ],
                  height: 170,
                  viewportFraction: context.isMobile ? 0.75 : 0.4,
                  autoPlay: true,
                  autoPlayAnimationDuration: 1.seconds,
                ))
          ]).p64().h(context.isMobile ? 400 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;

  const ProjectWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .neumorphic(color: Vx.green500, elevation: 5, curve: VxCurve.flat)
        .alignCenter
        .square(200)
        .make()
        .p16();
  }
}
