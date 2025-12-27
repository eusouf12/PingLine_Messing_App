import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:niche_line_messaging/view/components/custom_loader/custom_loader.dart';
import 'package:niche_line_messaging/view/components/custom_royel_appbar/custom_royel_appbar.dart';

import '../../../../service/api_url.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../components/custom_netwrok_image/custom_network_image.dart';
import '../../authentication/views/auth_screen/login_screen/login_screen.dart';
import '../controller/profile_controller.dart';



// ==================== Account Screen - UI Only ====================
class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getUserProfile();
    });
    return Scaffold(
      backgroundColor: const Color(0xFF0E1527),
      appBar: CustomRoyelAppbar(leftIcon: true, titleName: "Accounts",),

      body: Obx(() {
        // ================= LOADING =================
        if (profileController.rxRequestStatus.value == Status.loading) {
          return  Center(child: CustomLoader());
        }

        // ================= ERROR =================
        if (profileController.rxRequestStatus.value == Status.error) {
          return const Center(
            child: Text("Failed to load profile",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        // ================= SUCCESS =================
        final user = profileController.userProfileModel.value;
          debugPrint("user.photo===== ${ApiUrl.baseUrl}/${user.photo}");
        return Stack(
          children: [
            // Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF000000),
                    Color.fromARGB(255, 31, 41, 55),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),

            SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ================= Profile Card =================
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 14, 21, 39),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Profile Image
                        Stack(
                          children: [
                            ClipOval(
                              child: CustomNetworkImage(
                                imageUrl:user.photo.isNotEmpty
                                 ?  "${ApiUrl.baseUrl}/${user.photo}"
                                :AppConstants.profileImage,
                                height: 80.h,
                                width: 80.w,
                                boxShape: BoxShape.circle,
                              ),
                            ),

                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImagePickerOptions(context),
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2DD4BF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    size: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),

                        /// Name
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        /// Email
                        Text(
                          user.email,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// ================= Two Factor =================
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color:
                      const Color.fromARGB(255, 14, 21, 39),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Two-Factor Authentication',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Add extra protection for login',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white
                                      .withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color:
                          Colors.white.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// ================= Linked Devices =================
                  Text(
                    'Linked Devices',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  _buildDeviceCard(
                    deviceName: 'iPhone 15 Pro',
                    lastActive:
                    'Last active: Oct 12, 2025, 03:23 PM',
                    onMenuTap: () =>
                        _showDeviceOptions(context, 'iPhone 15 Pro'),
                  ),

                  SizedBox(height: 12.h),

                  _buildDeviceCard(
                    deviceName: 'Samsung Galaxy A56',
                    lastActive:
                    'Last active: Oct 12, 2025, 09:23 PM',
                    onMenuTap: () => _showDeviceOptions(
                        context, 'Samsung Galaxy A56'),
                  ),

                  SizedBox(height: 24.h),

                  /// ================= Logout =================
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: OutlinedButton(
                      onPressed: () =>
                          _showLogoutConfirmation(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(
                          color: Colors.red,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // ==================== Device Card Widget ====================
  Widget _buildDeviceCard({
    required String deviceName,
    required String lastActive,
    required VoidCallback onMenuTap,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 14, 21, 39),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          // Device Icon
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.phone_android, color: Colors.white, size: 24.sp),
          ),

          SizedBox(width: 12.w),

          // Device Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deviceName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  lastActive,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),

          // Menu Icon
          IconButton(
            onPressed: onMenuTap,
            icon: Icon(
              Icons.more_vert,
              color: Colors.white.withOpacity(0.5),
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  // ==================== Show Image Picker Options ====================
  void _showImagePickerOptions(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Change Profile Picture',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white,),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Color(0xFF2DD4BF)),
              title: const Text(
                'Take Photo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
                debugPrint('Camera selected');
                // TODO: Open camera
                 ImagePicker().pickImage(source: ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                color: Color(0xFF2DD4BF),
              ),
              title: const Text(
                'Choose from Gallery',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                profileController.pickImageFromGallery();
                debugPrint('Gallery selected');
                Get.back();
                // TODO: Open gallery

              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text(
                'Remove Photo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
                debugPrint('Remove photo');
                // TODO: Remove profile picture
              },
            ),
          ],
        ),
      ),
    );
  }

  // ==================== Show Device Options ====================
  void _showDeviceOptions(BuildContext context, String deviceName) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              deviceName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Remove Device',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _showRemoveDeviceConfirmation(context, deviceName);
              },
            ),
          ],
        ),
      ),
    );
  }

  // ==================== Show Remove Device Confirmation ====================
  void _showRemoveDeviceConfirmation(BuildContext context, String deviceName) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF1A1F3A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Remove Device?',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to remove $deviceName from your linked devices?',
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Success',
                'Device removed successfully',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              debugPrint('Device removed: $deviceName');
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // ==================== Show Logout Confirmation ====================
  void _showLogoutConfirmation(BuildContext context) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF1A1F3A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Log Out?', style: TextStyle(color: Colors.white)),
        content: Text(
          'Are you sure you want to log out from this device?',
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
               Get.offAll(()=> LoginScreen());

              // TODO: Perform logout
              // Get.offAllNamed(AppRoutes.loginScreen);
              debugPrint('User logged out');
              Get.snackbar("Success", "Log Out Successfull");
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
