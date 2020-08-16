import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp1/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutterapp1/pages/homepage.dart';
import 'package:flutterapp1/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: Stack(
              children: [
                BlocBuilder<NavigationBloc , NavigationStates>(
                  builder: (context , navigationStates) {
                    return navigationStates as Widget;
                  },
                ),
                SideBar(),
            ]
          ),
        ),
      );
  }
}
