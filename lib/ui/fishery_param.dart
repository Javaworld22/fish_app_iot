import 'package:fisheryproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controller/fish_controller.dart';

class FisheryParam extends StatefulWidget {
  const FisheryParam({Key? key}) : super(key: key);
  @override
  State<FisheryParam> createState() => _FisheryParam();
}


class _FisheryParam extends State<FisheryParam> {
bool pump = false;
bool valve = false;


  @override
  Widget build(BuildContext context) {
    WidgetsBinding?.instance?.addPostFrameCallback((_) {});
    return GetX<FishController>(
        init: FishController(),
    builder: (controller) {
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
                          'assets/images/notification.svg',),
                      ),
                      Positioned(
                        left: 15,
                        top: 0,
                        child: SvgPicture.asset('assets/images/ellipse2.svg',),
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
                children:  [
                  const SizedBox(width: 40,),
                  Text('${controller.title}',
                    style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1),
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
              SizedBox(height: 30,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          SvgPicture.asset('assets/images/battery_charge.svg',),
                          Text(
                            '${controller.field3.value} ',
                          //  "40%",
                            style:
                            new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          const Text("TDS",
                            style: TextStyle(color: Color.fromRGBO(
                                15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                // fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                          const Text("TDS value: ",
                            style: TextStyle(color: Color.fromRGBO(
                                15, 23, 36, 1),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Acme'),),
                          SizedBox(height: 18,),
                          // const Text("35°c",
                          //   style: TextStyle(color: Color.fromRGBO(21, 166, 62, 1),
                          //       fontStyle: FontStyle.normal,
                          //       //fontWeight: FontWeight.w700,
                          //       fontSize: 24,
                          //       fontFamily: 'Acme'),),
                        ],
                      ),
                    ),

                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Color.fromRGBO(180, 180, 180, 1),
                    progressColor: Color.fromRGBO(21, 166, 62, 1),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                width: 335,
                height: 30,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/power_settings.svg',
                            color: Colors.green),
                        const Text("Status",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                    const Row(
                      children: [
                        Text("Water Level: ",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                        Text("low",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Water Quality: ",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                    Row(
                      children:  [
                        Text(controller.field3.value,
                          style: const TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                  ],
                ),
              ),
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

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/temperature_low.svg',),
                          Text(
                            "${controller.field5.value} C",
                            style:
                            new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ],
                      ),

                      const Text("water Temp",
                        style: TextStyle(color: Color.fromRGBO(
                            15, 23, 36, 1),
                            fontStyle: FontStyle.normal,
                            // fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'Acme'),),
                      // const Text("Status",
                      //   style: TextStyle(color: Color.fromRGBO(
                      //       15, 23, 36, 1),
                      //       fontStyle: FontStyle.normal,
                      //       fontWeight: FontWeight.w700,
                      //       fontSize: 12,
                      //       fontFamily: 'Acme'),),
                      SizedBox(height: 18,),
                      // const Text("35°c",
                      //   style: TextStyle(color: Color.fromRGBO(21, 166, 62, 1),
                      //       fontStyle: FontStyle.normal,
                      //       //fontWeight: FontWeight.w700,
                      //       fontSize: 24,
                      //       fontFamily: 'Acme'),),
                    ],
                  ),
                ),

                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Color.fromRGBO(180, 180, 180, 1),
                progressColor: Color.fromRGBO(21, 166, 62, 1),
              ),
              Container(
                color: Colors.white,
                width: 335,
                height: 30,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/power_settings.svg',),
                        const Text("Status",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                    Row(
                      children: const [
                        Text("Flowrate : ",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                    Row(
                      children: [
                        //SvgPicture.asset('assets/images/temperature_low.svg',),
                        const Text("Discharge rate : ",
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
              ),
              Container(
                width: 335,
                height: 352,
                color: Colors.white,
                margin: EdgeInsets.only(left: 20, right: 20,),
                padding: EdgeInsets.only(left: 6, right: 8, top: 20,),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         SvgPicture.asset('assets/images/power_settings.svg',),
                    //         const Text("Status",
                    //           style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                    //               fontStyle: FontStyle.normal,
                    //               //fontWeight: FontWeight.w700,
                    //               fontSize: 12,
                    //               fontFamily: 'Acme'),),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         const Text("Charging",
                    //           style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                    //               fontStyle: FontStyle.normal,
                    //               //fontWeight: FontWeight.w700,
                    //               fontSize: 12,
                    //               fontFamily: 'Acme'),),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         SvgPicture.asset('assets/images/temperature_low.svg',),
                    //         const Text("Temperature",
                    //           style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                    //               fontStyle: FontStyle.normal,
                    //               //fontWeight: FontWeight.w700,
                    //               fontSize: 12,
                    //               fontFamily: 'Acme'),),
                    //       ],
                    //     ),
                    //     // Row(
                    //     //   children: const [
                    //     //     Text("35°c",
                    //     //       style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                    //     //           fontStyle: FontStyle.normal,
                    //     //           //fontWeight: FontWeight.w700,
                    //     //           fontSize: 12,
                    //     //           fontFamily: 'Acme'),),
                    //     //   ],
                    //     // ),
                    //   ],
                    // ),
                    SizedBox(height: 33,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("PH Scale:  ${controller.ph.value} ",
                          style: const TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: LinearPercentIndicator(
                        trailing: Text("14"),
                        leading: Text("0"),
                        //center: Text("V"),
                        widgetIndicator: Text("PH Scale ",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'Acme'),),
                        //width: MediaQuery.of(context).size.width - 50,
                        //width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 15.0,
                        animationDuration: 2000,
                        percent: controller.field4.value,
                        // center: Text("90.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.greenAccent,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Device Battery",
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
                        trailing: Text("100"),
                        leading: Text("0"),
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
                    Container(
                      color: Colors.white,
                      width: 335,
                      height: 30,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/power_settings.svg',),
                              const Text("Status",
                                style: TextStyle(
                                    color: Color.fromRGBO(15, 23, 36, 1),
                                    fontStyle: FontStyle.normal,
                                    //fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'Acme'),),
                            ],
                          ),
                          Row(
                            children: [
                              const Text("Charging",
                                style: TextStyle(
                                    color: Color.fromRGBO(15, 23, 36, 1),
                                    fontStyle: FontStyle.normal,
                                    //fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'Acme'),),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/temperature_low.svg',),
                              const Text("Temperature",
                                style: TextStyle(
                                    color: Color.fromRGBO(15, 23, 36, 1),
                                    fontStyle: FontStyle.normal,
                                    //fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'Acme'),),
                            ],
                          ),
                          Row(
                            children: const [
                              Text("35°c",
                                style: TextStyle(
                                    color: Color.fromRGBO(15, 23, 36, 1),
                                    fontStyle: FontStyle.normal,
                                    //fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'Acme'),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: 39,
                          height: 30,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              inactiveTrackColor: Color(0xff9D9D9D),
                              activeColor: Color(0xff2FB01A),
                              value: controller.pump.value == 'ON'?true:false,
                              onChanged: (bool value) async{
                                debugPrint('Switch is $value');
                                setState(() {
                                  //pump = !pump;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text( controller.pump.value == 'ON' ? "Pump  ON" : "Pump OFF",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: 'Acme'),),
                      ],
                    ),
SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: 39,
                          height: 30,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              inactiveTrackColor: Color(0xff9D9D9D),
                              activeColor: Color(0xff2FB01A),
                              value:  controller.valve.value == 'ON' ? true:false,
                              onChanged: (bool value) async{
                                debugPrint('Switch is $value');
                                setState(() {
                                 // valve = !valve;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text( controller.valve.value == 'ON' ? "Valve  ON" : "Valve OFF",
                          style: TextStyle(color: Color.fromRGBO(15, 23, 36, 1),
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: 'Acme'),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}