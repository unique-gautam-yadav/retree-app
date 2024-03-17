import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scenery_app/features/detail/screen/detail_screen.dart';
import 'package:scenery_app/features/home/models/retreat_model.dart';
import 'package:scenery_app/features/home/screens/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        navItems: [
          CustomNavItem(iconName: Iconsax.home5, selected: true),
          CustomNavItem(iconName: Iconsax.search_normal, selected: false),
          CustomNavItem(iconName: Iconsax.notification5, selected: false),
          CustomNavItem(iconName: Iconsax.user, selected: false),
        ],
        onItemSelected: (index) {
          // Handle item selection here
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(
              bottom: false,
              child: SizedBox(),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          height: .99,
                        ),
                      ),
                      Text(
                        "Ananya",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: .99,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const ShapeDecoration(
                      shape: StarBorder(
                        innerRadiusRatio: .8,
                        points: 10,
                        squash: .2,
                        valleyRounding: .1,
                        pointRounding: .5,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/dp.jpeg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/1_morning_bird.jpeg',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(.6),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          "Featured",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                blurRadius: 30,
                                spreadRadius: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          "Featured",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                blurRadius: 30,
                                spreadRadius: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Evening retreat in Paradise",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                shadows: [
                                  BoxShadow(
                                    blurRadius: 30,
                                    spreadRadius: 100,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.location,
                                  color: Colors.white,
                                  size: 12,
                                  shadows: [
                                    BoxShadow(
                                      blurRadius: 30,
                                      spreadRadius: 100,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "USA, Alabama",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 12,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 30,
                                        spreadRadius: 100,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Explore categories",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryButton(
                    color: Colors.green,
                    icon: FontAwesomeIcons.tree,
                    name: "Nature",
                  ),
                  SizedBox(width: 18),
                  CategoryButton(
                    color: Colors.brown,
                    icon: FontAwesomeIcons.personHiking,
                    name: "Adventure",
                  ),
                  SizedBox(width: 18),
                  CategoryButton(
                    color: Colors.red,
                    icon: Iconsax.heart_circle,
                    name: "Romance",
                  ),
                  SizedBox(width: 18),
                  CategoryButton(
                    color: Colors.indigo,
                    icon: FontAwesomeIcons.personRunning,
                    name: "Yoga",
                  ),
                  SizedBox(width: 18),
                  CategoryButton(
                    color: Colors.orangeAccent,
                    icon: FontAwesomeIcons.personRifle,
                    name: "Wildlife",
                  ),
                  SizedBox(width: 18),
                  CategoryButton(
                    color: Colors.teal,
                    icon: FontAwesomeIcons.personBiking,
                    name: "Biking",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Upcomming retreats",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 190,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: retreats.length,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return UpcommingCard(model: retreats[index], index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpcommingCard extends StatelessWidget {
  const UpcommingCard({
    super.key,
    required this.model,
    required this.index,
  });

  final RetreatModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              model: model,
              index: index,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Stack(
            children: [
              Hero(
                tag: Key("${index}__${model.assetName}"),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        model.assetName,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(.8),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        model.friends,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
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

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.color,
    required this.icon,
    required this.name,
  });

  final Color color;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
