import 'package:flutter/material.dart';
import 'package:ft_washing_app/components/common_appbar.dart';
import 'package:ft_washing_app/module/bottom/home/bag/monthly_bag_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/images.dart';
import 'package:get/get.dart';

class MonthlyBagScreen extends StatefulWidget {
  const MonthlyBagScreen({super.key});

  @override
  State<MonthlyBagScreen> createState() => _MonthlyBagScreenState();
}

class _MonthlyBagScreenState extends State<MonthlyBagScreen> {
  final monthlyBagController =
      Get.put<MonthlyBagController>(MonthlyBagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: true,
        title: ConstString.monthlyBags,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemCount: monthlyBagController.list.length,
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
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              laundryBag,
                              height: 150,
                            ),
                            Text(
                              monthlyBagController.list[index]['weight'],
                              style: const TextStyle().normal32Bold,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                monthlyBagController.list[index]['title'],
                                style: const TextStyle().normal18w600,
                                // overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                monthlyBagController.list[index]['price'],
                                style: const TextStyle()
                                    .normal20w600
                                    .textColor(AppColor.primary),
                              ),
                              Text(
                                "Tax included.",
                                style: const TextStyle().normal14w400,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Amount",
                                style: const TextStyle().normal16w500,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.remove),
                                    Text(
                                      "1",
                                      style: const TextStyle()
                                          .normal20w600
                                          .textColor(AppColor.primary),
                                    ),
                                    const Icon(Icons.add),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.primary,
                                ),
                                child: Center(
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle().normal14w500.textColor(
                                          AppColor.white,
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
