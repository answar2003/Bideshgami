import 'package:bideshgami/app/modules/apply/views/apply_view.dart';
import 'package:bideshgami/app/modules/details/views/details_view.dart';
import 'package:bideshgami/app/modules/home/views/home_view.dart';
import 'package:bideshgami/app/modules/login/bindings/login_bindings.dart';
import 'package:bideshgami/app/modules/profile/views/profile_view.dart';
import 'package:bideshgami/app/modules/service_selection/views/country_selection_view.dart';
import 'package:bideshgami/app/modules/service_selection/views/job_selection_view.dart';
import 'package:bideshgami/app/modules/service_selection/views/service_selection_view.dart';
import 'package:bideshgami/app/modules/signup/views/signup_view.dart';
import 'package:bideshgami/app/modules/signup/views/otp_view.dart';
import 'package:get/get.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: _Paths.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(name: _Paths.SIGNUP, page: () => SignupView(),),
    GetPage(name: _Paths.OTP, page: () => OtpVerificationView(),),
    GetPage(name: _Paths.SERVICESELECTION, page: () => ServiceSelectionView(),),
    GetPage(name: _Paths.COUNTRYSELECTION, page: () => CountrySelectionView(),),
    GetPage(name: _Paths.JOBSELECTION, page: () => JobSelectionView(),),
    GetPage(name: _Paths.HOME, page: () => HomeView(),),
    GetPage(name: _Paths.DETAILS, page: () => DetailsView(),),
    GetPage(name: _Paths.APPLY, page: () => ApplyFormView(),),
    GetPage(name: _Paths.PROFILE, page: () => ProfileView(),)
  ];
}
