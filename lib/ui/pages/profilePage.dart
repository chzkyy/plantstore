import 'package:flutter/material.dart';
import 'package:plantstore/cubit/auth_cubit.dart';
import 'package:plantstore/cubit/page_cubit.dart';
import 'package:plantstore/shared/theme.dart';
import 'package:plantstore/ui/widgets/CustomButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class profilePage extends StatelessWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/getStarted', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: defaultMargin,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: defaultMargin * 2,
                  ),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: kPrimaryColor,
                            child: Image.asset(
                              'assets/Profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                '${state.user.name}',
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${state.user.email}',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        title: Text('Favorite'),
                        onTap: () {
                          context.read<PageCubit>().setPage(1);
                        },
                      ),
                      ListTile(
                        title: Text('Cart'),                        
                        onTap: () {
                          context.read<PageCubit>().setPage(2);
                        },
                      ),
                      ListTile(
                        title: Text('Help'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('About'),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: defaultMargin * 4,
                      ),
                      CustomButton(
                        title: 'Sign Out',
                        width: 210,
                        color: kRedColor,
                        onPressed: () {
                          context.read<AuthCubit>().signOut();
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
