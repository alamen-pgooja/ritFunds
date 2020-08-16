//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutterapp1/pages/page_layout.dart';


class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                    // height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('نبذة عامة عن الصندوق' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.right),
                          Text('صندوق الخبير ريت هو صندوق استثمار عقاري متداول عام مقفل ومتوافق مع ضوابط الهيئة الشرعية، وتم إنشاؤه بموجب األنظمــة واللوائح المعمول بها في المملكة العربية السعودية ويخضع للوائح وتعليمات هيئة السوق المالية',
                            style: TextStyle(fontSize: 12 , color: Colors.black),
                            textAlign: TextAlign.right,
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: width - 32,
                    //height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('هدف الصندوق' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.right),
                          Text('إن الهدف االستثماري الرئيسي للصندوق هو تحقيق عوائد إيجارية مستمرة وتوزيعات نقدية دورية بنسبة ال تقل عن 90 %من صافي أرباح الصندوق السنوية، وذلك من خالل استثمار ما ال يقل عن 75 %من القيمة اإلجمالية ألصول الصندوق حسب آخر قوائم مالية مدققة في ُ أصول عقارية م ِدرة للدخل في المملكة العربية السعودية )باستثناء مدينتي مكة المكرمة والمدينة المنورة(. ',
                            style: TextStyle(fontSize: 12 , color: Colors.black),
                            textAlign: TextAlign.right,
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: width - 32,
                    //height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('استراتيجية استثمار الصندوق' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.right),
                          Text('سوف يسعى مدير الصندوق إلى تحقيق األهداف االستثمارية الخاصة بالصندوق والتي ترتكز بشكل رئيسي على تحقيق عوائد تأجيرية دورية من خالل تكوين محفظة استثمارية متنوعة من األصول العقارية التي تستوفي متطلبات أعمال نفي الجهالة والتي تحتوي على دراسات التقييم العقاري وجدوى االستثمار والدراسات الفنية والمراجعات القانونية وغيرها من الدراسات. وتشمل المحفظة العقارية المبدئية للصندوق على عقارات تتركز في القطاع السكني والمكتبي والتجزئة والموزعة في كل من مدينة الرياض ومدينة جدة ً ومدينة تبوك. سوف يسعى الصندوق مستقبال إلى االستثمار في عقارات أخرى قد تحتوي على استثمارات عقارية خارج المملكة العربية السعودية، والقيام باستثمارات أخرى بما ال يتعارض مع قيود االستثمار',
                            style: TextStyle(fontSize: 12 , color: Colors.black),
                            textAlign: TextAlign.right,
                          ),

                        ],
                      ),
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

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('العقارات' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.right),
                          Text('تتضمن المحفظة الاستثمارية للصندوق العقارات التالية: 1- مجمع الملقا السكني في مدينة الرياض 2- جالري مول في مدينة تبوك 3- مركز بلازو في مدينة الرياض 4- مركز هوم وركس في مدينة الرياض 5- مركز أهلا كورت في مدينة جدة 6- مركز بن تو التجاري في مدينة جدة 7- مركز النخبة التجاري في مدينة جدة.',
                            style: TextStyle(fontSize: 12 , color: Colors.black),
                            textAlign: TextAlign.right,
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: width - 32,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('نبذة عامة عن الصندوق' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.right),
                          Text('صندوق الخبير ريت هو صندوق استثمار عقاري متداول عام مقفل ومتوافق مع ضوابط الهيئة الشرعية، وتم إنشاؤه بموجب األنظمــة واللوائح المعمول بها في المملكة العربية السعودية ويخضع للوائح وتعليمات هيئة السوق المالية',
                            style: TextStyle(fontSize: 12 , color: Colors.black),
                            textAlign: TextAlign.right,
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),


                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}


