import 'package:flutter/material.dart';
import 'package:ft_washing_app/components/common_appbar.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/res/color_schema.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        isShowBackButton: true,
        appBar: AppBar(),
        title: ConstString.checkOut,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.primary.withOpacity(0.06)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total cost:",
                    style: const TextStyle().normal18w500,
                  ),
                  Text(
                    "\$650",
                    style: const TextStyle().normal20w600,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Shipping Address",
              style: const TextStyle().normal20w600,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.primary,
                      width: 1,
                    ),
                    color: AppColor.primary.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Mostafa salah",
                                style: const TextStyle().normal18w600,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.primary,
                                ),
                                child: Text(
                                  "Home",
                                  style: const TextStyle()
                                      .normal14w500
                                      .textColor(AppColor.white),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cairo",
                        style: const TextStyle().normal16w400,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Nasar City, Cairo, Cgypt",
                        style: const TextStyle().normal16w400,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Payment",
              style: const TextStyle().normal20w600,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primary,
                  width: 1,
                ),
                color: AppColor.primary.withOpacity(0.06),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet_outlined,
                            color: AppColor.gray800,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Credit / Debit Card",
                                style: const TextStyle().normal18w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed(AppRouter.editAddressScreen);
                            },
                            child: const Icon(Icons.arrow_forward_ios,
                                size: 22, color: AppColor.gray800),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CommonAppButton(
              buttonType: ButtonType.enable,
              text: ConstString.confirmPayment,
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(AppRouter.checkOutScreen);
                // registerController.registerUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
