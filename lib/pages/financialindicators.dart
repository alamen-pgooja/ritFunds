import 'package:flutter/material.dart';
import 'package:flutterapp1/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutterapp1/pages/page_layout.dart';


class FinancialIndicators extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFf5f4fc),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
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
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15 , left: 10 ,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new IconButton(
                            icon: Icon(Icons.arrow_back , color: Colors.white,),
                            onPressed: null,
                          ),
                          Text('الخبير ريت',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DataTable(
                                columns: [
                                  DataColumn(label: Text('البيان')),
                                  DataColumn(label: Text('السعر')),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text('سعر الوحدة ')),
                                    DataCell(Text('10.90 ر. س')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('صافي قيمة أصول ')),
                                    DataCell(Text('600,355,144 ر. س')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('إجمالي الدخل التأجيري')),
                                    DataCell(Text('72,181.028  ريال سعودي')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('إجمالي األرباح')),
                                    DataCell(Text('41,592,934  ريال سعودي')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('الربح الموزع لكل وحدة')),
                                    DataCell(Text('0.626  ريال سعودي')),
                                  ]),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
