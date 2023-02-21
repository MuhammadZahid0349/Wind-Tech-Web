import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wind_tech_solutions/utils/constants.dart';
import 'package:wind_tech_solutions/utils/utils.dart';

import '../../../models/carousel_item_model.dart';

List<CarouselItemModel> carouselItems(double carouselContainerHeight) =>
    List.generate(
      5,
      (index) => CarouselItemModel(
        text: SizedBox(
          height: carouselContainerHeight,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Mobile Application Developer",
                      style: GoogleFonts.josefinSans(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.sp,
                        letterSpacing: 2,
                      ),
                    ),
                    18.h.heightBox,
                    Text(
                      "Wind Tech Solutions".toUpperCase(),
                      style: GoogleFonts.josefinSans(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                        letterSpacing: 2.3,
                      ),
                    ),
                    10.h.heightBox,
                    Row(
                      children: [
                        Text(
                          "Android and Web Development, ",
                          style: GoogleFonts.josefinSans(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              letterSpacing: 1,
                              height: 1.0),
                        ),
                        Icon(
                          Icons.location_on,
                          color: logoSky,
                          size: 14,
                        ),
                        2.w.widthBox,
                        Text(
                          "Karachi",
                          style: GoogleFonts.josefinSans(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              letterSpacing: 2,
                              height: 1.0),
                        )
                      ],
                    ),
                    25.h.heightBox,
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: logoSky,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 48.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.h,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Utilty.openUrl(AppConstants.linkedInUrl);
                          },
                          child: Text(
                            "Let's  Talk",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SizedBox(
                  height: carouselContainerHeight - 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: AppConstants.socialLoginDatas
                        .map((e) => InkWell(
                              onTap: e.onTap,
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                margin: const EdgeInsets.all(10),
                                child: Image.asset(e.title),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
        image: Container(
          child: Image.asset(
            AppConstants.Mainbg,
          ),
        ),
      ),
    );
