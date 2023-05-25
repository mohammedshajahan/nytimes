import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/app/common/constant.dart';
import 'package:test/app/common/text.dart';
import 'package:test/app/modules/home/views/single_list_item.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            //open drawer menu
          },
          child: const Icon(
            Icons.menu,
            color: colorWhite,
            size: 20,
          ),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: colorWhite,
                  size: 20,
                ),
              ),
              kHorizontalSpace(width: 8.0),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert,
                  color: colorWhite,
                  size: 20,
                ),
              ),
              kHorizontalSpace(width: 8.0),
            ],
          ),
        ],
        backgroundColor: primaryColor,
        title: Text(
          "NY Times Most Popular",
          style: testTextStyle(type: "18", weight: FONTWEIGHT.medium)
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(initState: (state) {
        controller.getMostViewed();
      }, builder: (controller) {
        return controller.isLoading!
            ? Center(
                child: CircularProgressIndicator(color: Colors.red),
              )
            : ListView.builder(
                itemCount: controller.mostViewedList!.length,
                itemBuilder: (context, index) {
                  return SingleListItem(
                    mostViewedList: controller.mostViewedList![index],
                  );
                });
      }),
    );
  }
}
