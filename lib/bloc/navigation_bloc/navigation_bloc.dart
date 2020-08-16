import 'package:bloc/bloc.dart';
import 'package:flutterapp1/pages/essentialnews.dart';
import 'package:flutterapp1/pages/financialstatements.dart';
import 'package:flutterapp1/pages/homepage.dart';
import 'package:flutterapp1/pages/mymap.dart';
import 'package:flutterapp1/pages/financialindicators.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyMapClickedEvent,
  FinancialIndicatorsClickedEvent,
  FinancialStatementsClickedEvent,
  EssentialNewsClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents , NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyMapClickedEvent:
        yield MyMap();
        break;
      case NavigationEvents.FinancialIndicatorsClickedEvent:
        yield FinancialIndicators();
        break;
      case NavigationEvents.FinancialStatementsClickedEvent:
        yield FinancialStatements();
        break;
      case NavigationEvents.EssentialNewsClickedEvent:
        yield EssentialNews();
        break;




    }
  }
  
}