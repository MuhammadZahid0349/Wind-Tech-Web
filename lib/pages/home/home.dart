import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:wind_tech_solutions/models/project.dart';
import 'package:wind_tech_solutions/pages/home/components/about.dart';
import 'package:wind_tech_solutions/pages/home/components/carousel.dart';
import 'package:wind_tech_solutions/pages/home/components/footer.dart';
import 'package:wind_tech_solutions/pages/home/components/header.dart';
import 'package:wind_tech_solutions/pages/home/components/portfolio_stats.dart';
import 'package:wind_tech_solutions/pages/home/components/project.dart';
import 'package:wind_tech_solutions/pages/home/components/service.dart';
import 'package:wind_tech_solutions/provider/home.dart';
import 'package:wind_tech_solutions/utils/globals.dart';
import 'package:wind_tech_solutions/utils/screen_helper.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          // behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          behavior: ScrollConfiguration.of(context)
              .copyWith(scrollbars: false, dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30.h : 20.h,
                ),
                Carousel(
                  key: _homeProvider.homeKey,
                ),
                20.h.heightBox,
                AboutSection(
                  key: _homeProvider.aboutKey,
                ),
                ServiceSection(
                  key: _homeProvider.servicesKey,
                ),
                SizedBox(
                  key: _homeProvider.portfolioKey,
                  height: 100.h,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Portfolio",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 36.sp,
                      ),
                    ),
                    5.h.heightBox,
                    Text(
                      "Here are some of my Previous Work :)",
                      style: GoogleFonts.josefinSans(
                        color: Colors.grey[400],
                        fontSize: 14.sp,
                      ),
                    ),
                    15.h.heightBox,
                  ],
                )),
                ProjectSection(
                  projects: ProjectModel.projects,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 28.w),
                  child: PortfolioStats(),
                ),
                50.h.heightBox,
                Footer(
                  key: _homeProvider.contactKey,
                )
              ],
            ),
          ),
        ),
        Header(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 24.w,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    if (Globals.scaffoldKey.currentState != null) {
                      if (Globals.scaffoldKey.currentState!.isEndDrawerOpen) {
                        Navigator.pop(context);
                        _homeProvider
                            .scrollBasedOnHeader(HeaderRow.headerItems[index]);
                      }
                    }
                  },
                  leading: Icon(
                    HeaderRow.headerItems[index].iconData,
                  ),
                  title: Text(
                    HeaderRow.headerItems[index].title,
                    style: const TextStyle(),
                  ),
                  // trailing: HeaderRow.headerItems[index].isDarkTheme != null
                  //     ? HeaderRow.headerItems[index].isDarkTheme!
                  //         ? SizedBox(
                  //             width: 50.w,
                  //             child: CustomSwitch(
                  //               value: ref.watch(themeProvider).isDarkMode,
                  //               onChanged: (val) {
                  //                 ref.read(themeProvider).changeTheme(val);
                  //                 ThemeSwitcher.of(context).changeTheme(
                  //                     theme: ref
                  //                         .read(themeProvider)
                  //                         .getCurrentTheme,
                  //                     isReversed: false // default: false
                  //                     );
                  //               },
                  //             ),
                  //           )
                  //         : null
                  //     : null,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: HeaderRow.headerItems.length,
            ),
          ),
        ),
      ),
      body: _buildPage(),
    );
  }
}
