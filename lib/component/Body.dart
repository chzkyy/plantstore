import 'package:flutter/material.dart';
import 'package:plantstore/shared/theme.dart';
import 'package:plantstore/ui/widgets/featuredPlants.dart';
import 'package:plantstore/ui/widgets/headerwithSearch.dart';
import 'package:plantstore/ui/widgets/recomend_plant.dart';
import 'package:plantstore/ui/widgets/title_with_more_btn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          featuredPlants(),
          SizedBox(height: defaultPadding * 4),
        ],
      ),
    );
  }
}
