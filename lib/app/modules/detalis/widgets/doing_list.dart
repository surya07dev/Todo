import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/core/utils/extensions.dart';
import 'package:todo/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
        ? Column(
            children: [
              Image.asset(
                'assets/images/todo.png',
                fit: BoxFit.cover,
              ),
              Text(
                'Add Task',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0.sp),
              )
            ],
          )
        : ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...homeCtrl.doingTodos
                  .map((element) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 3.0.wp,
                          horizontal: 9.0.wp,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.grey),
                                onChanged: (value) {
                                  homeCtrl.doneTodo(element['title']);
                                },
                                value: element['done'],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              element['title'],
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ))
                  .toList(),
              if (homeCtrl.doingTodos.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: const Divider(thickness: 2),
                )
            ],
          ));
  }
}
