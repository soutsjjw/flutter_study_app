import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void website() {
    _launch(
      Uri(
        scheme: "https",
        path: "https://www.dbestech.com",
      ),
    );
  }

  void facebook() {
    _launch(
      Uri(
        scheme: "https",
        path: "https://www.facebook.com",
      ),
    );
  }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: "mailto",
      path: "souts.jjw@gmail.com",
    );
    _launch(emailLaunchUri);
  }

  _launch(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'could not launch $url';
    }
  }
}
