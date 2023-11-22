import 'package:flutter/material.dart';
import 'package:ft_washing_app/components/common_appbar.dart';
import 'package:ft_washing_app/module/bottom/new_order/product_selection_screen/product_selection_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class ProductSelectionScreen extends StatefulWidget {
  const ProductSelectionScreen({super.key});

  @override
  State<ProductSelectionScreen> createState() => _ProductSelectionScreenState();
}

class _ProductSelectionScreenState extends State<ProductSelectionScreen> {
  final productSelectionController =
      Get.put<ProductSelectionController>(ProductSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        isShowBackButton: false,
        title: ConstString.makeYourOrder,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.gray800,
              size: 25,
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              // childAspectRatio: MediaQuery.of(context).size.width /
              //     (MediaQuery.of(context).size.height / 1.),
              mainAxisExtent: MediaQuery.of(context).size.height/4,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            padding: const EdgeInsets.only(
                top: 20, left: 20, right: 20, bottom: 100),
            shrinkWrap: true,
            itemCount: productSelectionController.productList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                    // color: AppColor.greenAccent,
                    ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        productSelectionController.productList[index]['image'],
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            productSelectionController.productList[index]
                                ['product'],
                            style: const TextStyle().normal20w400,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColor.primaryYellow,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "4.9",
                              style: const TextStyle()
                                  .normal16w600
                                  .textColor(AppColor.gray400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productSelectionController.productList[index]['price'],
                          style: const TextStyle()
                              .normal20wBold
                              .textColor(AppColor.primary),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.primary.withOpacity(0.06)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.remove),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "1",
                                  style: const TextStyle()
                                      .normal20w600
                                      .textColor(AppColor.primary),
                                ),
                              ),
                              const Icon(Icons.add),
                            ],
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CommonAppButton(
              buttonType: ButtonType.enable,
              text: ConstString.next,
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(AppRouter.cartScreen);
                // registerController.registerUser();
              },
            ),
          ),
        ],
      ),
    );
  }
}
