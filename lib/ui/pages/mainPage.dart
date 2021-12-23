import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantstore/cubit/page_cubit.dart';
import 'package:plantstore/ui/pages/cartPage.dart';
import 'package:plantstore/ui/pages/favPage.dart';
import 'package:plantstore/ui/pages/homePage.dart';
import 'package:plantstore/ui/pages/profilePage.dart';
import 'package:plantstore/ui/widgets/customButtomNavigationItem.dart';
import 'package:plantstore/shared/theme.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return homePage();
        case 1:
          return favPage();
        case 2:
          return cartPage();
        case 3:
          return profilePage();
        default:
          return homePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/Home.png',
              ),
              CustomBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/Union.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/Cart.png',
              ),
              CustomBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/Profile.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
