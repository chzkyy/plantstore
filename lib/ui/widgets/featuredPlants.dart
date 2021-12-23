import 'package:flutter/material.dart';
import 'package:plantstore/shared/theme.dart';

class featuredPlants extends StatelessWidget {
  const featuredPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          featuredPlantCard(
            image: "assets/catalog1.jpg",
            title: "Samantha",
            price: 400,
            press: () {},
          ),
          featuredPlantCard(
            image: "assets/catalog1.jpg",
            title: "Angelica",
            price: 400,
            press: () {},
          ),
          featuredPlantCard(
            image: "assets/catalog1.jpg",
            title: "Samantha",
            price: 400,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class featuredPlantCard extends StatelessWidget {
  const featuredPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final int price;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding,
        top: 15,
        right: defaultPadding,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        elevation: 5.0,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100,
                width: 70,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: press,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$$price",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: semiBold,
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
