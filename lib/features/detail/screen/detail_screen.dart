// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:scenery_app/features/home/models/retreat_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.model,
    required this.index,
  });

  final RetreatModel model;
  final int index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PaletteGenerator? paletteGenerator;

  pallegeGenerate() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
        AssetImage(widget.model.assetName));

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    pallegeGenerate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paletteGenerator?.dominantColor?.color ??
          paletteGenerator?.vibrantColor?.color ??
          Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MyAppBar(
              assetName: widget.model.assetName,
              index: widget.index,
              name: widget.model.name,
              palette: paletteGenerator,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    "The dreaming still bust and fiend that sad but. Oh stern never a over presently chamber sorrow. Thrilled the on lenore each fancy. Bird unbroken the door oer that the press and flutter, thou let beating disaster rapping into wore, shrieked implore is yore burden seeming nameless, wind prophet my to there. Name i still myself there gently. From much surcease is chamber there both my aptly said. Pallas name shall art the came said velvet shore heard, implore the flung to with nights, farther above being i terrors. Burden take marvelled thy days. Days truly thy but on not, the late dreams nights the sorrow is i, dreaming is of of and, in ever is no or an on reclining, that wandering eyes velvet thou shore stately yore i. And ominous and be the by above madam lenore when, above the books for for soul, into out raven i window but and radiant in, it word ah respiterespite some. I air i more name a sent, i my more the sitting sad nevermore, there said be books this if or, or respiterespite friends still that while of that of visiter, quaff lenore i fancy presently but as on sitting rapping, more wrought a door but gently at, but what i hopes nothing denser door and wrought, on the name i shorn stopped followed thy of just. Engaged my raven my the, entrance lord stayed to nights flung lady and, both my some bust dared grim at of of on, an than chamber hesitating sad before. Bust fiery seeing whom quoth still marvelled burned one, and mystery lining more as bust token sir and the, perched on while some stood of wind nothing flirt vainly, bleak before whether of door cannot more purple, to store nothing there upon, and till."
                    "The dreaming still bust and fiend that sad but. Oh stern never a over presently chamber sorrow. Thrilled the on lenore each fancy. Bird unbroken the door oer that the press and flutter, thou let beating disaster rapping into wore, shrieked implore is yore burden seeming nameless, wind prophet my to there. Name i still myself there gently. From much surcease is chamber there both my aptly said. Pallas name shall art the came said velvet shore heard, implore the flung to with nights, farther above being i terrors. Burden take marvelled thy days. Days truly thy but on not, the late dreams nights the sorrow is i, dreaming is of of and, in ever is no or an on reclining, that wandering eyes velvet thou shore stately yore i. And ominous and be the by above madam lenore when, above the books for for soul, into out raven i window but and radiant in, it word ah respiterespite some. I air i more name a sent, i my more the sitting sad nevermore, there said be books this if or, or respiterespite friends still that while of that of visiter, quaff lenore i fancy presently but as on sitting rapping, more wrought a door but gently at, but what i hopes nothing denser door and wrought, on the name i shorn stopped followed thy of just. Engaged my raven my the, entrance lord stayed to nights flung lady and, both my some bust dared grim at of of on, an than chamber hesitating sad before. Bust fiery seeing whom quoth still marvelled burned one, and mystery lining more as bust token sir and the, perched on while some stood of wind nothing flirt vainly, bleak before whether of door cannot more purple, to store nothing there upon, and till.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends SliverPersistentHeaderDelegate {
  final String assetName;
  final int index;
  final String name;
  final PaletteGenerator? palette;
  MyAppBar({
    required this.assetName,
    required this.index,
    required this.name,
    required this.palette,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = 1;
    double opacity2 = 0;

    if (shrinkOffset > 100) {
      opacity2 = (shrinkOffset - 300) / 50;
    }

    if (shrinkOffset > 200) {
      opacity = (shrinkOffset - 200) / 150;

      opacity = 1 - opacity;
    }

    if (opacity2 > 1) {
      opacity2 = 1;
    }

    if (opacity2 < 0) {
      opacity2 = 0;
    }

    if (opacity < 0) {
      opacity = 0;
    }

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          assetName,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                palette?.dominantColor?.color ??
                    palette?.vibrantColor?.color ??
                    Colors.white,
              ],
            )),
          ),
        ),
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Iconsax.arrow_left,
                  color: Colors.white,
                ),
              ),
              Opacity(
                opacity: opacity2,
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 16,
          right: 16,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 500),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.scale(
                    scale: 1 + value, // Scale factor for the title
                    child: Opacity(
                      opacity: 1 - value, // Opacity factor for the title
                      child: Opacity(
                        opacity: opacity,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 600;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
