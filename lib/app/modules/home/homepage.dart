import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:todo/app/modules/home/controller.dart';
import 'package:todo/app/core/utils/extensions.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //My app
          title: const Text("мое приложение"),
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                //surya
                "Сурья",
                style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
