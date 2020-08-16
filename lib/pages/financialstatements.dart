import 'package:flutter/material.dart';
import 'package:flutterapp1/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutterapp1/pages/page_layout.dart';

class FinancialStatements extends StatefulWidget with NavigationStates {
  @override
  _FinancialStatementsState createState() => _FinancialStatementsState();
}

class _FinancialStatementsState extends State<FinancialStatements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f4fc),
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              CustomPaint(
                child: Container(
                  height: 200.0,
                ),
                painter: CurvePainter(),
              ),
              /*ClipPath(
                clipper: TopWaveClipper1(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:   [
                        Color(0xFF9b1b20),
                        Color(0xFF751519),
                        Color(0xFF541013),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width - 100,
                ),
              ),*/

            ],
          ),

        ],
      ),
    );
  }
}
