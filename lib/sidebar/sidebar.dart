import 'dart:async';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp1/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController  _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenStream;
  StreamSink<bool> isSidebarOpenSink;
  //final bool isSidebarOpen = true;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenSink.add(false);
      _animationController.reverse();
    }else {
      isSidebarOpenSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenStream,
      builder: (context , isSidebarOpenAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenAsync.data ? 0 : -screenWidth,
          right: isSidebarOpenAsync.data ? 0 : screenWidth - 162,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 130, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              //textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.black87,
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Image.asset('assets/logo.png' , height: 130,),

                          MenuItem(icon: Icons.home, title: 'نظرة عامة عن الصندوق', onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                          },),
                          MenuItem(icon: Icons.business, title: 'عقارات الصندوق', onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyMapClickedEvent);
                          },),
                          MenuItem(icon: Icons.assessment, title: 'المؤشرات المالية لصندوق', onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.FinancialIndicatorsClickedEvent);
                          },),
                          MenuItem(icon: Icons.monetization_on, title: 'البيانات المالية نهاية السنة', onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.FinancialStatementsClickedEvent);
                          },),
                          MenuItem(icon: Icons.info_outline, title: 'اخبار جوهرية ', onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.EssentialNewsClickedEvent);
                          },),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.75),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 110,
                          color: Colors.black87,
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animationController.view , color: Colors.white, size: 20,),
                        ),
                      ),
                    ),
                  )
                ],
            ),
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper <Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 15, 5, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width , height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}
