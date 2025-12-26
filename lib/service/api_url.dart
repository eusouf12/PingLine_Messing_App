class ApiUrl {
  static String socketUrl({required String id}) => "http://3.23.1.245:5002?userId=$id";
  static const String baseUrl = "https://less-controls-council-lessons.trycloudflare.com";

  ///========================= Authentication & Profile ==========================
  static const String signUp = "/api/v1/users/create_user";
  static const String signIn = "/api/v1/auth/login_user";
  static const String verificationOtp = "/api/v1/users/user_verification";
  static const String forgotPassword = "/api/v1/users/forgot_password";
  static String recentOtp({required String email})=> "/api/v1/users/resend_verification_otp/$email";
  static const String verificationOtpForgetPass = "/api/v1/users/verification_forgot_user";
  static const String newPassword = "/api/v1/user/reset_password";

  // ================Setting Profile ===================
  static const String termsCondition = "/api/v1/setting/find_by_terms_conditions";
  static const String privacyPolicy = "/api/v1/setting/find_by_privacy_policys";
  static const String updateProfile = "/api/v1/auth/update_my_profile";
  static const String myProfile = "/api/v1/auth/myprofile";

  static const String refreshToken = "/api/v1/auth/refresh-token";
  static const String helpSupport = "/api/v1/help_support/recorded_help_support";
  static const String changePassword = "/api/v1/user/change_password";
  static const String googleAuth = "/api/v1/user/google_auth";
}
