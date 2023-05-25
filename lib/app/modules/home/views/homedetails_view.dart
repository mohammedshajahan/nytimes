import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/app/common/constant.dart';
import 'package:test/app/common/text.dart';
import 'package:test/app/modules/home/model/most_viewed_model.dart';
import 'package:test/app/modules/home/views/single_list_item.dart';

class HomedetailsView extends GetView {
  MostViewedModel? data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "The New York Times",
          style: testTextStyle(type: "18", weight: FONTWEIGHT.medium)
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              data?.title ?? "",
              style:
                  testTextStyle(type: "h2", weight: FONTWEIGHT.bold).copyWith(
                color: kGrey80,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            kVerticalSpace(height: 16.0),
            Text(
              data?.mostViewedModelAbstract ?? "",
              style:
                  testTextStyle(type: "h4", weight: FONTWEIGHT.medium).copyWith(
                color: kGrey80,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: 293,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data
                              ?.media?.first.mediaMetadata![2].url ??
                          "https://library.northwestu.edu/wp-content/uploads/2019/06/nytimes.png"))),
            ),
            Text(
              data?.media?.first.copyright ?? "",
              style: testTextStyle(type: "CAPTION", weight: FONTWEIGHT.medium)
                  .copyWith(
                color: kGrey40,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
