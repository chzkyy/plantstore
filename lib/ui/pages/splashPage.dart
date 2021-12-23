import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantstore/cubit/auth_cubit.dart';
import 'package:plantstore/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class splashPage extends StatefulWidget {
  const splashPage({Key? key}) : super(key: key);

  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/getStarted', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
          ],
        ),
      ),
    );
  }
}
