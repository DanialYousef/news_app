import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/screens/buisness_screen.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/screens/science_screen.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/screens/setting_screen.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/screens/sport_screen.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/states.dart';


//دانيال يوسف يوسف

class AppNewsCubit extends Cubit<AppNewsStates>{
    AppNewsCubit() : super(AppinitialState());
    static AppNewsCubit get(context) => BlocProvider.of(context);
    int currentindex = 0 ;
    bool isDark = false;
    List<Widget> screens = [
        BuisnessScreen(),
        SportScreen(),
        SciensScreen(),
        SettingScreen(),
    ];
    List<BottomNavigationBarItem> listofitem = [
         BottomNavigationBarItem(
             icon: Icon(Icons.business_center),
             label: 'Business',
         ),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Sport',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Science',
        ),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.settings),
        //     label: 'Settings',
        // ),
    ];
    void changeindex (int index){
        currentindex = index;
        emit(AppchangeState());
    }

    void changeMode (){
        isDark = !isDark;
        emit(AppchangeModeState());
    }

}