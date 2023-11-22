import 'package:flutter/material.dart';
import 'package:ft_washing_app/module/bottom/profile/profile_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        centerTitle: true,
        title: ConstString.myProfile,
      ),
      backgroundColor: AppColor.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primary.withOpacity(0.06),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyProfileWidget(
                      title: ConstString.firstName,
                      value: profileController.userData.value?.firstName ?? "",
                    ),
                    const MyDivider(),
                    MyProfileWidget(
                      title: ConstString.lastName,
                      value: profileController.userData.value?.lastName ?? "",
                    ),
                    const MyDivider(),

                    MyProfileWidget(
                      title: ConstString.email,
                      value: profileController.userData.value?.email ?? "",
                    ),
                    const MyDivider(),

                    MyProfileWidget(
                      title: ConstString.phoneNumber,
                      value: profileController.userData.value?.mobileNumber ?? "",
                    ),
                    const MyDivider(),

                    MyProfileWidget(
                      title: ConstString.gender,
                      value: profileController.userData.value?.gender ?? "",
                    ),
                    const MyDivider(),

                    MyProfileWidget(
                      title: ConstString.age,
                      value: profileController.userData.value?.age.toString() ?? "",
                    ),
                    const MyDivider(),

                    MyProfileWidget(
                      title: ConstString.registerDate,
                      value: profileController.userData.value?.registerDate.toString() ?? "",
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}

class MyProfileWidget extends StatelessWidget {
  MyProfileWidget({
    super.key,
    required this.title,
    required this.value,
  });

  String? title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: const TextStyle().normal20w600.textColor(AppColor.gray600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value ?? "",
          style: const TextStyle().normal18w600,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
