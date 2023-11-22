import 'package:flutter/material.dart';
import 'package:ft_washing_app/module/bottom/new_order/cart/cart_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.put<CartController>(CartController());

  List<String> items = [
    "Jacket",
    "Shirt",
    "Shoes",
    "Jacket",
    "Shirt",
    "Shoes",
    "Jacket",
    "Shirt",
    "Shoes"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        isShowBackButton: true,
        appBar: AppBar(),
        title: ConstString.cart,
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.5,
              color: AppColor.gray400.withOpacity(0.2),
              offset: const Offset(0, -1),
              blurRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: MediaQuery.of(context).size.height / 3.1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total:",
                  style: const TextStyle().normal18w500,
                ),
                Text(
                  "\$700",
                  style: const TextStyle().normal20w600,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Fees:",
                  style: const TextStyle().normal18w500,
                ),
                Text(
                  "\$0",
                  style: const TextStyle().normal20w600,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount:",
                  style: const TextStyle().normal18w500,
                ),
                Text(
                  "-\$50",
                  style: const TextStyle().normal20w600,
                ),
              ],
            ),
            const Divider(
              thickness: 0.2,
              color: AppColor.primary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total cost:",
                  style: const TextStyle().normal18w500,
                ),
                Text(
                  "-\$650",
                  style: const TextStyle().normal20w600,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CommonAppButton(
              buttonType: ButtonType.enable,
              text: ConstString.proceedCheckOut,
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(AppRouter.addressSelectionScreen);
                // registerController.registerUser();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 250),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              background: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryRed.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.delete,
                  color: AppColor.primaryRed,
                  size: 30,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.primary.withOpacity(0.06),
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://media.istockphoto.com/id/163208487/photo/male-coat-isolated-on-the-white.jpg?s=612x612&w=0&k=20&c=3Sdq5xnVS2jOYPNXI6JLwAumzyelcP_VgKVW0MVUhwo=",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            items[index],
                            style: const TextStyle()
                                .normal20w400
                                .textColor(AppColor.gray800),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$5",
                                style: const TextStyle()
                                    .normal20wBold
                                    .textColor(AppColor.primary),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColor.primary.withOpacity(0.06)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.remove),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
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
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
