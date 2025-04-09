import 'dart:async';

import 'package:fisheryproject/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:dio/dio.dart' as dio;

class FishController extends GetxController {
  RxString title = "Smart Fish Farm".obs;
  RxString field1 = ''.obs;
  RxString field2 = ''.obs;
  RxString field3 = ''.obs;
  RxDouble field4 = 0.0.obs;
  RxString field5 = ''.obs;
  RxString field6 = ''.obs;
  RxString ph = ''.obs;
  RxString valve = ''.obs;
  RxString pump = ''.obs;
  Timer? timer;

  @override
  void onInit() async {
    await fishFeed1();
    await fishFeed2();
    await fishFeed3();
    await fishFeed4();
    await fishFeed5();
    await fishFeed8();

    super.onInit();
  }

  @override
  void onReady() async {
    timer = Timer.periodic(const Duration(milliseconds: 5000), ((timer) async{
      await fishFeed1();
      await fishFeed2();
      await fishFeed3();
      await fishFeed4();
      await fishFeed5();
      await fishFeed8();
    }));
    super.onReady();
  }

  Future<void> fishFeed1() async {
    debugPrint('From arrived page');
    try {
      dio.Response response = await Repository.fields();
      if (kDebugMode) {
        debugPrint('response');
        //log(response.toString(), name: 'Request_Ride'); //journeyTime.value
        debugPrint(response.data['feeds'].toString());

        //response.data['data']['token']
      }
      for (var rides in List.from(response.data['feeds'])) {
        if(rides['field1'] != null){
          debugPrint(rides['field1']);
          field1.value = rides['field1'];
        }
        update();
        notifyChildrens();
      }

      update();
      notifyChildrens();
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e);
        print(e.error);
      }
    } finally {}
  }

  Future<void> fishFeed2() async {
    debugPrint('Field2');
    try {
      dio.Response response = await Repository.field2();
      if (kDebugMode) {
        debugPrint('response');
        //log(response.toString(), name: 'Request_Ride'); //journeyTime.value
        debugPrint(response.data['feeds'].toString());

        //response.data['data']['token']
      }
      for (var rides in List.from(response.data['feeds'])) {
        if(rides['field2'] != null){
          debugPrint(rides['field2']);
          field2.value = rides['field2'];
        }

        update();
        notifyChildrens();
      }

      update();
      notifyChildrens();
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e);
        print(e.error);
      }
    } finally {}
  }

  Future<void> fishFeed3() async {
    debugPrint('Field3');
    try {
      dio.Response response = await Repository.field3();
      if (kDebugMode) {
        debugPrint('response');
        //log(response.toString(), name: 'Request_Ride'); //journeyTime.value
        debugPrint(response.data['feeds'].toString());

        //response.data['data']['token']
      }
      for (var rides in List.from(response.data['feeds'])) {
        if(rides['field3'] != null){
          debugPrint(rides['field3']);
          field3.value = rides['field3'];
        }

        update();
        notifyChildrens();
      }

      update();
      notifyChildrens();
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e);
        print(e.error);
      }
    } finally {}
  }

  Future<void> fishFeed4() async {
    debugPrint('Field4');
    try {
      dio.Response response = await Repository.field4();
      if (kDebugMode) {
        debugPrint('response');
        //log(response.toString(), name: 'Request_Ride'); //journeyTime.value
        debugPrint(response.data['feeds'].toString());

        //response.data['data']['token']
      }
      for (var rides in List.from(response.data['feeds'])) {
        if(rides['field4'] != null ){
          if(rides['field4'] != '0'){
            debugPrint(rides['field4']);
            try{
              ph.value = rides['field4'];
              field4.value = (double.parse(rides['field4'].toString()) /14);
            }catch(e){
              debugPrint('Error occurred here $e');
            }
          }

        }


        update();
        notifyChildrens();
      }

      update();
      notifyChildrens();
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e);
        print(e.error);
      }
    } finally {}
  }

  Future<void> fishFeed5() async {
    debugPrint('Field5');
    try {
      dio.Response response = await Repository.field5();
      if (kDebugMode) {
        debugPrint('response');
        //log(response.toString(), name: 'Request_Ride'); //journeyTime.value
        debugPrint(response.data['feeds'].toString());

        //response.data['data']['token']
      }
      for (var rides in List.from(response.data['feeds'])) {
        if(rides['field5'] != null){
          debugPrint(rides['field5']);
          field5.value = rides['field5'];
        }

        update();
        notifyChildrens();
      }

      update();
      notifyChildrens();
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e);
        print(e.error);
      }
    } finally {}
  }

  Future<void> fishFeed8() async {
    debugPrint('Field8');
    try {
      dio.Response response = await Repository.field8();
      if (kDebugMode) {
        debugPrint('response');
        //log(response.toString(), name: 'Request_Ride'); //journeyTime.value
        debugPrint(response.data['feeds'].toString());

        //response.data['data']['token']
      }
      for (var rides in List.from(response.data['feeds'])) {
        if(rides['field8'] != null){
          String value = rides['field8'].toString();
          debugPrint(rides['field8']);
         if(value == '0'){
           valve.value = 'OFF';
           pump.value = 'OFF';
         }else if(value == '2'){
           pump.value = 'OFF';
           valve.value = 'ON';
         }else if(value == '4'){
           pump.value = 'ON';
           valve.value = 'OFF';
         }else if(value == '5'){
           pump.value = 'ON';
           valve.value = 'ON';
         }
        }

        update();
        notifyChildrens();
      }

      update();
      notifyChildrens();
    } on dio.DioException catch (e) {
      if (kDebugMode) {
        print(e);
        print(e.error);
      }
    } finally {}
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }

}
