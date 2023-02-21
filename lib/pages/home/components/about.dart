import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wind_tech_solutions/models/technology.dart';
import 'package:wind_tech_solutions/utils/constants.dart';
import 'package:wind_tech_solutions/utils/screen_helper.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: Get.width,
            minWidth: Get.width,
            defaultScale: false,
            child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        100.h.heightBox,
                        Center(
                          child: Text(
                            "About Me",
                            style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                                fontSize: 35.sp,
                                decoration: TextDecoration.underline,
                                // decorationColor: kPrimaryColor,
                                decorationStyle: TextDecorationStyle.double),
                          ),
                        ),
                        25.h.heightBox,
                        Text(
                          "I'm Muhammad Zahid, Android, IOS and Web Developer!!!",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            fontSize: 24.sp,
                          ),
                        ),
                        10.h.heightBox,
                        Text(
                          "\t\t\t\t           I am a 7th semester undergraduate student at Sir Syed University of engineering & technology in the field of Computer Science. I have been developing Mobile Apps for more than 1 year now. I have worked as a Team and as an Indivual in various organization. Always love to learn new technologies and to succeed in an environment of growth and excellence and earn a job which provides me job satisfaction and self-development and help me achieve personal as well as organisational goals.",
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.sp,
                          ),
                        ),
                        20.h.heightBox,
                        Text(
                          "Technology I have worked with",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.h.heightBox,
                        Consumer(builder: (context, ref, _) {
                          return ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: ScrollPhysics(),
                              child: Row(
                                children: TechnologyConstants.technologyLearned
                                    .map((e) => MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 6),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: Image.asset(
                                                            e.logo)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      e.name,
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 70.0,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                if (ScreenHelper.isDesktop(context) ||
                    ScreenHelper.isTablet(context))
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: Container(
                        height: 300.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2.w, color: Colors.white),
                            shape: BoxShape.circle),
                        child: CircleAvatar(radius: 50.r),
                      ),
                    ),

                    // child: SvgPicture.asset(
                    //   AppConstants.personSvg,
                    //   width: constraints.maxWidth > 720.0 ? null : 200.0,
                    // ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
