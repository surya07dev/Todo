import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/models/task.dart';
import 'package:todo/app/modules/home/controller.dart';
import 'package:todo/app/core/utils/extensions.dart';
import 'package:todo/app/modules/home/widgets/add_card.dart';
import 'package:todo/app/modules/home/widgets/add_dialog.dart';
import 'package:todo/app/modules/home/widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(4.0.wp),
            child: Text(
              "My list",
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(
            () => GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...controller.tasks
                    .map((element) => LongPressDraggable(
                        data: element,
                        onDragStarted: () => controller.changeDeleting(true),
                        onDraggableCanceled: (_, __) =>
                            controller.changeDeleting(false),
                        onDragEnd: (_) => controller.changeDeleting(false),
                        feedback: Opacity(
                          opacity: 0.8,
                          child: TaskCard(task: element),
                        ),
                        child: TaskCard(task: element)))
                    .toList(),
                AddCard(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: DragTarget(
        builder: (_, __, ___) {
          return Obx(
            () => controller.tasks.isEmpty
                ? const SizedBox()
                : SizedBox(
                  height: controller.deleting.value ? 80 : null,
                  width: controller.deleting.value ? 80 : null,
                  child: FloatingActionButton(
                      backgroundColor:
                          controller.deleting.value ? Colors.red : null,
                      onPressed: () => Get.to(
                            () => AddDialog(),
                            transition: Transition.downToUp,
                          ),
                      child: Icon(
                          controller.deleting.value ? Icons.delete : Icons.add)),
                ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess("Delete Sucess");
        },
      ),
    );
  }
}
