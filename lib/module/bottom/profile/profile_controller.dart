import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ft_washing_app/data/model/user_model.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/firebase_string.dart';

class ProfileController extends GetxController {
  final userData = Rxn<UserData>();

  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(FirebaseString.users)
          .doc(AppPref().uid)
          .get();

      if (documentSnapshot.exists) {
        userData.value =
            UserData.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        if (kDebugMode) {
          print("Document not found");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching document: $e");
      }
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }
}
