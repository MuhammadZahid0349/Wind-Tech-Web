import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:wind_tech_solutions/models/header_item.dart';
import 'package:wind_tech_solutions/provider/home.dart';
import 'package:wind_tech_solutions/routes/routes.dart';
import 'package:wind_tech_solutions/utils/constants.dart';
import 'package:wind_tech_solutions/utils/globals.dart';
import 'package:wind_tech_solutions/utils/screen_helper.dart';

////////////////// Text of Logo  /////////////////////////
class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.initial);
            },
            child: Row(
              children: [
                Container(
                    height: 50.h,
                    child: Image.asset(
                      AppConstants.windLogo,
                      fit: BoxFit.contain,
                    )),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "ind Te",
                        style: GoogleFonts.josefinSans(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "ch Solutions",
                        style: GoogleFonts.josefinSans(
                          color: kPrimaryColor,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);
  // final Widget themeSwitch;
  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "Home",
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: "About",
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: "Services",
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: "Portfolio",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "Contact",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: "Blogs",
          onTap: () {
            // Utilty.openUrl(AppConstants.mediumUrl);
          },
          iconData: Icons.article,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return Row(children: [
            ...headerItems
                .map(
                  (item) => item.title == "Themes"
                      ? const Text("")
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            margin: EdgeInsets.only(right: 30.h),
                            child: GestureDetector(
                              onTap: () {
                                item.onTap();
                                HomeProvider _homeProvider =
                                    ref.read(homeProvider);
                                _homeProvider.scrollBasedOnHeader(item);
                              },
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: item.title == "Blogs"
                                      ? kPrimaryColor
                                      : null,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                )
                .toList(),
          ]);
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context),
      mobile: buildMobileHeader(context),
      tablet: buildHeader(context),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.60),
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: Icon(
                Icons.menu,
                size: 28.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 24.h : 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            HeaderRow(),
          ],
        ),
      ),
    );
  }
}
