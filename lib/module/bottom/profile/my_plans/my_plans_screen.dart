import 'package:ft_washing_app/module/bottom/profile/my_plans/my_plans_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';
import 'package:ft_washing_app/utils/images.dart';

class MyPlansScreen extends StatefulWidget {
  const MyPlansScreen({super.key});

  @override
  State<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends State<MyPlansScreen> {
  final myPlanController = Get.put<MyPlanController>(MyPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: true,
        title: "Our Plan",
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
                              "5 KG",
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
                                "5KG MONTHLY PLAN // 1 5kg bag per week, includes washing and folding.",
                                style: const TextStyle().normal18w600,
                                // overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "24 Aug 2023 to 24 Sept 2023",
                                style: const TextStyle()
                                    .normal18w600
                                    .textColor(AppColor.primaryGreen),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "\$250",
                                style: const TextStyle()
                                    .normal20w600
                                    .textColor(AppColor.primary),
                              ),
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
