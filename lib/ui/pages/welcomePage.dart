import 'package:flutter/material.dart';
import 'package:plantstore/shared/theme.dart';
import 'package:plantstore/ui/widgets/CustomButton.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.only(bottom: 295),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/plant.png'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Green Garden',
                    style: whiteTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Text(
                  'Create your small garden at home,\nand choose the green.',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  width: 287,
                  margin: EdgeInsets.only(top: 50, bottom: 80),
                  title: 'Get Started',
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
