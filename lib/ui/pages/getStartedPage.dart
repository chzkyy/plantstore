import 'package:flutter/material.dart';
import 'package:plantstore/shared/theme.dart';
import 'package:plantstore/ui/widgets/CustomButton.dart';

class getStartedPage extends StatelessWidget {
  const getStartedPage({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 160),
                  width: 287,
                  height: 162,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/plant.png',
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  width: 287,
                  margin: EdgeInsets.only(top: 250, bottom: 30),
                  title: 'Sign in',
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                ),
                CustomButton(
                  width: 287,
                  margin: EdgeInsets.only(bottom: 30),
                  title: 'Sign up',
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
                // CustomButton(
                //   width: 287,
                //   title: 'Sign in with Google',
                //   color: kRedColor,
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/signup');
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
