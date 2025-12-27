import 'package:get/get.dart';
import 'package:niche_line_messaging/view/screens/authentication/controller/auth_controller.dart';
import 'package:niche_line_messaging/view/screens/splash_screen/splash_screen.dart';
import 'package:niche_line_messaging/view/screens/onboarding_screen/views/onboarding_screen.dart';
import 'package:niche_line_messaging/view/screens/authentication/views/verify_pincode_screen/verify_pincode_screen.dart';
import 'package:niche_line_messaging/view/screens/authentication/views/recovery_key_screen/recovery_screen1.dart';
import 'package:niche_line_messaging/view/screens/authentication/views/recovery_key_screen/final_recovery_screen.dart';
import 'package:niche_line_messaging/view/screens/home/views/home_screen.dart';
import 'package:niche_line_messaging/view/screens/subscription/view/subscription_screen_one.dart';
import '../../view/screens/authentication/views/auth_screen/forgot_screen/forgot_screen.dart';
import '../../view/screens/authentication/views/auth_screen/login_screen/login_screen.dart';
import '../../view/screens/authentication/views/auth_screen/set_new_password/set_new_password.dart';
import '../../view/screens/authentication/views/auth_screen/sign_up_screen/sign_up_screen.dart';
import '../../view/screens/settings/views/privacy_screen.dart';
import '../../view/screens/settings/views/privacy_security_screen.dart';
import '../../view/screens/settings/views/terms_services_screen‎.dart';

class AppRoutes {
  // ==================== Route Names ====================
  static const String splashScreen = '/splash_screen';
  static const String onboardingScreen = '/onboarding';
  static const String loginScreen = "/LoginScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String otpScreen = "/otpScreen";
  static const String verifyPicCodeScreen = "/verify_otp";
  static const String recoverySetupScreen = '/recovery_setup_1';
  static const String finalRecoveryScreen = '/final_recovery';
  static const String homeScreen = '/home';
  static const String subscriptionScreen = '/subscription';
  static const String settingScreen = "/SettingScreen";
  static const String forgotScreen = "/ForgotScreen";
  static const String privacyScreen = "/PrivacyScreen";
  static const String privacySecurityScreen = "/PrivacySecurityScreen";
  static const String termsServicesScreen = "/TermsServicesScreen";
  static const String setNewPassword = "/SetNewPassword";

  // ==================== Pages List ====================
  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: forgotScreen, page: () => ForgotScreen()),
    GetPage(name: privacyScreen, page: () => PrivacyScreen()),
    GetPage(name: privacySecurityScreen, page: () => PrivacySecurityScreen()),
    GetPage(name: termsServicesScreen, page: () => TermsServicesScreen()),
    GetPage(name: setNewPassword, page: () => SetNewPassword()),
    GetPage(name: verifyPicCodeScreen, page: () => TwoFactorAuthScreen(), binding: BindingsBuilder(() {Get.lazyPut(() => AuthController());}),),
    GetPage(name: recoverySetupScreen, page: () => RecoveryKeySetupScreenOne(), binding: BindingsBuilder(() {Get.lazyPut(() => AuthController());}),),
    GetPage(name: finalRecoveryScreen, page: () => const FinalRecoveryScreen()),
    GetPage(name: homeScreen, page: () =>  HomeScreen()),
    GetPage(name: subscriptionScreen, page: () => const SubscriptionScreenOne(),),

  ];
}
