import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/app/common/constant.dart';
import 'package:test/app/common/text.dart';
import 'package:test/app/modules/home/model/most_viewed_model.dart';
import 'package:test/app/routes/app_pages.dart';

class SingleListItem extends StatelessWidget {
  MostViewedModel? mostViewedList;
  SingleListItem({
    this.mostViewedList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              width: 40,
              decoration:
                  const BoxDecoration(color: kGrey40, shape: BoxShape.circle),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mostViewedList!.title ?? "",
                  maxLines: 2,
                  style: testTextStyle(type: "B1", weight: FONTWEIGHT.medium)
                      .copyWith(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                kVerticalSpace(height: 8.0),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        mostViewedList!.byline ?? "",
                        maxLines: 2,
                        style:
                            testTextStyle(type: "B2", weight: FONTWEIGHT.medium)
                                .copyWith(
                          color: kGrey20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
                kVerticalSpace(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.black45,
                      size: 15,
                    ),
                    kHorizontalSpace(width: 4.0),
                    Text(
                      '2017-06-23.',
                      style: testTextStyle(
                              type: "CAPTION", weight: FONTWEIGHT.medium)
                          .copyWith(
                        color: kGrey20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                // RichText(
                //   text: TextSpan(children: [
                //     TextSpan(
                //       text: mostViewedList!.byline ?? "",
                //       style: testTextStyle(
                //               type: "CAPTION", weight: FONTWEIGHT.medium)
                //           .copyWith(
                //         color: kGrey20,
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     ),
                //     WidgetSpan(
                //       child: kHorizontalSpace(width: 15.0),
                //     ),
                //     const WidgetSpan(
                //       child: Icon(
                //         Icons.calendar_month_rounded,
                //         color: Colors.black45,
                //         size: 15,
                //       ),
                //     ),
                //     WidgetSpan(
                //       child: kHorizontalSpace(width: 8.0),
                //     ),
                //     TextSpan(
                //       text: '2017-06-23.',
                //       style: testTextStyle(
                //               type: "CAPTION", weight: FONTWEIGHT.medium)
                //           .copyWith(
                //         color: kGrey20,
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     ),
                //   ]),
                // ),
              ],
            ),
          ),
          Expanded(
              child: InkWell(
            onTap: () {
              Get.toNamed(Routes.HOME + Routes.HOMEDETAILS,
                  arguments: mostViewedList);
            },
            child: Icon(
              Icons.chevron_right_rounded,
              color: kGrey80,
            ),
          ))
        ],
      ),
    );
  }
}
