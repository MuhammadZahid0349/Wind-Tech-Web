import 'package:wind_tech_solutions/utils/constants.dart';

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel python =
      TechnologyModel("Python", AppConstants.pythonImage);

  static TechnologyModel csharp =
      TechnologyModel("C #", AppConstants.CsharpImage);

  static TechnologyModel flutter =
      TechnologyModel("Flutter", AppConstants.flutterImage);

  static TechnologyModel Android =
      TechnologyModel("Android", AppConstants.androidImage);

  static TechnologyModel firebase =
      TechnologyModel("Firebase", AppConstants.firebaseImage);

  static TechnologyModel cPlus =
      TechnologyModel("C++", AppConstants.cPlusImage);

  static TechnologyModel sql = TechnologyModel("SQL", AppConstants.sqlImage);

  // static TechnologyModel razorPay =
  //     TechnologyModel("RazorPay", AppConstants.razorPayImage);

  static List<TechnologyModel> technologyLearned = [
    flutter,
    sql,
    csharp,
    cPlus,
    python,
    firebase,
  ];
}
