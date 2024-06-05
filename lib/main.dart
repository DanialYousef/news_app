import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/cubit.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/states.dart';
import 'package:my_app/network/remote/dio_helper.dart';
import 'package:my_app/style/theme.dart';

import 'layout/news_app_navigation_bar/buttom_navigation_bar.dart';




void main(){
  runApp(const Danial());
  DioHelper.init();
}


class Danial extends StatelessWidget {
  const Danial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppNewsCubit(),
      child: BlocConsumer<AppNewsCubit, AppNewsStates>(
        listener: (context,state){},
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light ,
            home: ButtomNavigationBar(),
          );
        },
      ),

    );
  }
}
