import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}



class _Dashboard extends State<Dashboard>{

  late bool _flagPH = false, _flagdts = false, _flagTemp = true;


  @override
  Widget build(BuildContext context) {
    // WidgetsBinding?.instance?.addPostFrameCallback((_) {});
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 123,
        elevation: 0,
        leading: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                SizedBox(width: 5,),
                IconButton(
                  icon: const Icon(Icons.search_rounded, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ],
        ),

        backgroundColor: const Color.fromRGBO(13, 42, 84, 1),
        actions: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                //margin: const EdgeInsets.only( top: 63, right: 38,),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: SvgPicture.asset(
                        'images/notification.svg',),
                    ),
                    Positioned(
                      left: 15,
                      top: 0,
                      child: SvgPicture.asset('images/ellipse2.svg',),
                    ),
                    const Positioned(
                      left: 19,
                      top: 0,
                      child: Text("6",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 15,),
          // SvgPicture.asset('assets/images/threedot.svg',),
          // const SizedBox(width: 15,)
        ],
        title: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const SizedBox(height: 25,),
            Row(
              children: const [
                SizedBox(width: 40,),
                Text("Site 100100",
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: 'Acme'),),
              ],
            ),

          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 14,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                InkWell(
                  onTap: (){
                     setState(() {
                       _flagTemp = true;
                       _flagdts = false;
                       _flagPH = false;
                     });
                  },
                child: AnimatedContainer(
                  width: 154,
                  height: 50,
                  decoration:  BoxDecoration( //const Color.fromRGBO(255, 255, 255, 1)
                    border: Border.all(width: 1.0, color: const Color.fromRGBO(196, 196, 196, 1),),
                    color: _flagTemp ? const Color.fromRGBO(13, 42, 84, 1): null,
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('images/battery_charge.svg',color: Color.fromRGBO(255, 255, 255, 1),),
                       Text("Temperature",
                        style: TextStyle(color: _flagTemp ? const Color.fromRGBO(
                            245, 245, 245, 1) : const Color.fromRGBO(15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                    ],
                  ),
                ),
    ),
                InkWell(
                  onTap: (){
                    setState(() {
                      _flagTemp = false;
                      _flagdts = false;
                      _flagPH = true;
                    });
                  },
                child: AnimatedContainer(
                  width: 154,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _flagPH ?  const Color.fromRGBO(13, 42, 84, 1) : null,
                    border: Border.all(width: 1.0, color: const Color.fromRGBO(196, 196, 196, 1),),
                  ),
                  duration:const Duration(milliseconds: 300),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("PH",
                        style: TextStyle(color: _flagPH ? const Color.fromRGBO(245, 245, 245, 1)
                            : const Color.fromRGBO(15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                    ],
                  ),
                ),
    ),
                InkWell(
                  onTap: (){
                    setState(() {
                      _flagTemp = false;
                      _flagdts = true;
                      _flagPH = false;
                    });
                  },
                child: Container(
                  width: 154,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _flagdts ? const Color.fromRGBO(13, 42, 84, 1) : null,
                    border: Border.all(width: 1.0, color: const Color.fromRGBO(196, 196, 196, 1),),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                       Text("DTS",
                        style: TextStyle(color: _flagdts ? const Color.fromRGBO(245, 245, 245, 1): const Color.fromRGBO(15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                    ],
                  ),
                ),
    ),
              ],
            ),
            const SizedBox(height: 15,),
            if (_flagPH)
              CircularPercentIndicator(
                radius: 208.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15.0,
                percent: 0.3,
                center: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('images/battery_charge.svg',),
                      Text(
                        "40%",
                        style:
                        new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      const Text("Remaining time",
                        style: TextStyle(color: Color.fromRGBO(
                            15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            // fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                      const Text("1hrs 31mins",
                        style: TextStyle(color: Color.fromRGBO(
                            15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                      SizedBox(height: 18,),
                      const Text("35°c",
                        style: TextStyle(color: Color.fromRGBO(21, 166, 62, 1),
                            fontStyle: FontStyle.normal,
                            //fontWeight: FontWeight.w700,
                            fontSize: 24,
                            fontFamily: 'Acme'),),
                    ],
                  ),
                ),

                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Color.fromRGBO(180, 180, 180, 1),
                progressColor: Color.fromRGBO(21, 166, 62, 1),
              ),

            Padding(
              padding: EdgeInsets.all(15.0),
              child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                percent: 0.7,
                center: new Text("70%"),
                backgroundColor: Color.fromRGBO(180, 180, 180, 1),
                progressColor: Color.fromRGBO(205, 144, 77, 1),
              ),
            ),
            if (_flagdts)
            Container(
              width: 335,
              height: 352,
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, right: 20,),
              padding: EdgeInsets.only(left: 6, right: 8, top: 20,),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('images/power_settings.svg',),
                          const Text("Status",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Charging",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('images/temperature_low.svg',),
                          const Text("Temperature",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("35°c",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 43,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('images/electric_plug.svg',),
                          const Text("Power",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Plugged",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('images/battery_charge.svg',color: const Color.fromRGBO(172, 11, 11, 1),),
                          const Text("Battery level",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("60%",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 43,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('images/voltage.svg',),
                          const Text("Voltage",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("0v",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('images/power_settings.svg',color: const Color.fromRGBO(165, 103, 36, 1),),
                          SizedBox(width: 5,),
                          const Text("power",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("1.0kW",
                            style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                //fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 67,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Charge current",
                        style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            //fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                      Text("100mA",
                        style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            //fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      //width: MediaQuery.of(context).size.width - 50,
                      //width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 15.0,
                      animationDuration: 2000,
                      percent: 0.9,
                      center: Text("90.0%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.greenAccent,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Average charge speed",
                        style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            //fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                      Text("30.1%",
                        style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            //fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      //width: MediaQuery.of(context).size.width - 50,
                      //width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 15.0,
                      animationDuration: 2000,
                      percent: 0.9,
                      center: Text("90.0%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: const Color.fromRGBO(205, 144, 77, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}