
import 'package:ft_washing_app/module/bottom/new_order/address_selection/address_selection_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

class AddressSelectionScreen extends StatefulWidget {
  const AddressSelectionScreen({super.key});

  @override
  State<AddressSelectionScreen> createState() => _AddressSelectionScreenState();
}

class _AddressSelectionScreenState extends State<AddressSelectionScreen> {
  final addressSelectionController =
      Get.put<AddressSelectionController>(AddressSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(AppRouter.editAddressScreen);

              },
              child: const Icon(
                Icons.edit,
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            InputField(
              prefixIcon: const Visibility(
                visible: true,
                child: Icon(
                  Icons.search,
                  color: AppColor.primary,
                  size: 25,
                ),
              ),
              controller: addressSelectionController.firstNameController,
              hint: ConstString.findAddress,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onChange: (value) {
                addressSelectionController.firstNameString.value = value ?? "";
              },
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index == 1 ? AppColor.primary : Colors.transparent,
                        width: 1,
                      ),
                      color: AppColor.primary.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 15),
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
            ),
            CommonAppButton(
              buttonType: ButtonType.enable,
              text: ConstString.next,
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(AppRouter.checkOutScreen);

              },
            ),
            const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
