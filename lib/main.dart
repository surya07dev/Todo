import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/app/data/services/storage/services.dart';
import 'package:todo/app/modules/home/homepage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init(),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) { 
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo Application',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}
