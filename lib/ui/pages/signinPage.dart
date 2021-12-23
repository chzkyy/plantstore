import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantstore/cubit/auth_cubit.dart';
import 'package:plantstore/ui/widgets/CustomButton.dart';
import 'package:plantstore/ui/widgets/CustomForm.dart';
import 'package:plantstore/shared/theme.dart';

class signinPage extends StatelessWidget {
  signinPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget signInButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/signup');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
          ),
          child: Text(
            'Don\'t have an account? Sign Up',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    Widget emailInput() {
      return CustomTextFormField(
        title: 'Email Address',
        hintText: 'Your Email Adress',
        controller: emailController,
      );
    }

    Widget passwordInput() {
      return CustomTextFormField(
        title: 'Password',
        hintText: 'Your Password',
        obscureText: true,
        controller: passwordController,
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomButton(
            title: 'Sign In',
            color: kPrimaryColor,
            onPressed: () {
              context.read<AuthCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text);
            },
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/plant_logo.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 270),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
              ),
            ),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Welcome Back!',
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: extraBold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: Text(
                        'Login to  your account',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  ),
                  emailInput(),
                  passwordInput(),
                  submitButton(),
                  signInButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
