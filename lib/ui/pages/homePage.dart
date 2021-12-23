import 'package:flutter/material.dart';
import 'package:plantstore/component/Body.dart';
import 'package:plantstore/shared/theme.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
    );
  }
}
