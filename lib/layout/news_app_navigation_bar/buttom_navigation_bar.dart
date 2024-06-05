
//ابراهيم غالب بدران
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/cubit.dart';
import 'package:my_app/layout/news_app_navigation_bar/cubit/states.dart';
import 'package:my_app/network/remote/dio_helper.dart';

class ButtomNavigationBar extends StatelessWidget {
  const ButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppNewsCubit(),
        child: BlocConsumer<AppNewsCubit,AppNewsStates>(
          listener: (context,state){},
          builder: (context,state){
            AppNewsCubit cubit = AppNewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
              title :   Text('News App'),
                actions:
                [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.brightness_6_outlined),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(onPressed: ()
              {
                  DioHelper.getData(
                      url: 'v2/top-headlines',
                      query: {
                        'country': 'eg',
                        'category': 'business',
                        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
                      }).then((value)
                    {

                      print(value.data.toString());
                    }
                  ).catchError((errror){
                    print(errror.toString());
                  });
              },
              child: Icon(Icons.add),
              ),
              bottomNavigationBar: ConvexAppBar(
                initialActiveIndex: cubit.currentindex,
                onTap: (int index) {
                  cubit.changeindex(index);
                  print(cubit.currentindex);
                },
                items: cubit.listofitem.map((item) {
                  return TabItem(
                    icon: item.icon,
                    title: item.label,
                  );
                }).toList(),
                color: Colors.white, // Set the background color of the navigation bar
                activeColor: Colors.deepOrange, // Set the color for the selected item
                style: TabStyle.titled, // Set the desired shape style
              ),
              body: cubit.screens[cubit.currentindex],
            );
          },
        )
    );
  }
}
