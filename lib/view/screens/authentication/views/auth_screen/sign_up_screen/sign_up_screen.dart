import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../../../../../../utils/app_images/app_images.dart';
import '../../../../../../utils/app_strings/app_strings.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_image/custom_image.dart';
import '../../../../../components/custom_loader/custom_loader.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/custom_text_field/custom_text_field.dart';
import '../../../controller/auth_controller.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final authController = Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24 , top: 50,  bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                CustomImage(
                  imageSrc: AppImages.splashScreenImage,
                  height: 50.h,
                  width: 50.h,
                ),
                SizedBox(height: 20),
                Obx(() =>
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              // onTap: () => authController.toggleTab(true),
                              onTap: () {
                                authController.toggleTab(true);
                                Get.find<AuthController>().toggleTab(true);
                                Get.back();
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: authController.loginLoading.value ? AppColors.lightGreen : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow:authController.loginLoading.value
                                      ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                      : null,
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: "Sign In",
                                    fontWeight: FontWeight.w500,
                                    color: authController.loginLoading.value
                                        ? AppColors.white
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // create Account
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                authController.toggleTab(true);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: !authController.loginLoading.value ? AppColors.lightGreen : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: !authController.loginLoading.value
                                      ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                      : null,
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: "Create Account",
                                    fontWeight: FontWeight.w500,
                                    color:  !authController.loginLoading.value
                                        ? AppColors.white
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                 SizedBox(height: 32),
                // middle container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(
                        text: "Full Name",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textEditingController: authController.nameController.value,
                        hintText: "Enter your name",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: const Icon(
                          Icons.person_outlined,
                          color: Color(0xFF9CA3AF),
                          size: 20,),
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFE5E7EB),
                        fieldBorderRadius: 12,
                        keyboardType: TextInputType.emailAddress,

                      ),
                      //Email
                      CustomText(
                        text: AppStrings.email,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                        top: 10,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textEditingController: authController.emailController.value,
                        hintText: AppStrings.enterYourEmail,
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFF9CA3AF),
                          size: 20,),
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFE5E7EB),
                        fieldBorderRadius: 12,
                        keyboardType: TextInputType.emailAddress,

                      ),
                      const SizedBox(height: 10),
                      //location
                      CustomText(
                        text: "Location",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                        top: 10,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textEditingController: authController.locationController.value,
                        hintText: "Enter Your Location",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF9CA3AF),
                          size: 20,),
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFE5E7EB),
                        fieldBorderRadius: 12,
                        keyboardType: TextInputType.text,

                      ),
                      const SizedBox(height: 10),
                      // Password Field
                      CustomText(
                        text: AppStrings.password,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textEditingController: authController.passwordController.value,
                        hintText: "Create a strong password",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF9CA3AF),
                          size: 22,
                        ),
                        isPassword: true,
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFE5E7EB),
                        fieldBorderRadius: 12,
                        onChanged: (value) {
                          authController.validatePasswordLive(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your Password';
                          }

                          if (authController.passwordError.value.isNotEmpty) {
                            return authController.passwordError.value;
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      // confirmPassword
                      CustomText(
                        text: AppStrings.confirmPassword,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        textEditingController:  authController.confirmPasswordController.value,
                        hintText: "Retype password",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF9CA3AF),
                          size: 22,
                        ),
                        isPassword: true,
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFE5E7EB),
                        fieldBorderRadius: 12,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm Password';
                          } else if (value !=
                              authController.passwordController.value.text) {
                            return 'Password not Match';

                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                //  Create Account Button
                Obx((){
                return authController.signUpLoading.value
                ? CustomLoader()
                :
                CustomButton(
                  onTap: () {
                    authController.signUp();
                  },
                  borderRadius: 12,
                  textColor: AppColors.white,
                  title: "Create Account",
                  fillColor: AppColors.lightGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                 );
          }),
                SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomText(text: "By continuing, you agree to NichLine's "),
                    GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.termsServicesScreen);
                        },
                        child: CustomText(text: "Terms ",color: AppColors.lightGreen)
                    ),
                    CustomText(text: "and "),
                    GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.privacyScreen);
                        },
                        child: CustomText(text: "Privacy Policy",color: AppColors.lightGreen)),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
