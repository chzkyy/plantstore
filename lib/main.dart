import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantstore/cubit/auth_cubit.dart';
import 'package:plantstore/cubit/page_cubit.dart';
import 'package:plantstore/ui/pages/cartPage.dart';
import 'package:plantstore/ui/pages/favPage.dart';
import 'package:plantstore/ui/pages/getStartedPage.dart';
import 'package:plantstore/ui/pages/homePage.dart';
import 'package:plantstore/ui/pages/mainPage.dart';
import 'package:plantstore/ui/pages/signinPage.dart';
import 'package:plantstore/ui/pages/signupPage.dart';
import 'package:plantstore/ui/pages/splashPage.dart';
import 'package:plantstore/ui/pages/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => splashPage(),
          '/welcomePage': (context) => welcomePage(),
          '/getStarted': (context) => getStartedPage(),
          '/signin' : (context) => signinPage(),
          '/signup': (context) => signupPage(),
          '/welcomePage': (context) => welcomePage(),
          '/main': (context) => mainPage(),
          '/homePage': (context) => homePage(),
          '/favPage': (context) => favPage(),
          '/cartPage': (context) => cartPage(),
        },
      ),
    );
  }
}
