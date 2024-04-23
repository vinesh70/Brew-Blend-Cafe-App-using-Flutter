import 'package:coffee_shop_get/consts/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../consts/app_constants.dart';

class MyDrawer extends StatelessWidget {
  GetStorage box = GetStorage();

  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    void logout() {
      box.erase();
      Get.offAllNamed(Appconstants.splashroute);
    }
    return Drawer(
      width: size.width * .7,
      backgroundColor: homescafold_color,
      child: Column(
        children: [
          SizedBox(
              height: size.height * .35,
              child: Image.asset(
                'images/cats/coffe_ic.jpg',
                fit: BoxFit.fill,
              )),
          kSizedBox,
          kSizedBox,
          InkWell(
              onTap: () => Get.toNamed(Appconstants.homeroute),
              child: buildrawertile(context, "Home", Icons.home_filled)),
          InkWell(
              onTap: () => Get.toNamed(Appconstants.contactroute),
              child: buildrawertile(context, "Contact Us", Icons.contact_page)),
          InkWell(
              onTap: () => Get.toNamed(Appconstants.cartroute),
              child: buildrawertile(context, "Your Cart", Icons.shopping_cart)),
          InkWell(
              onTap: () => logout(),
              child: buildrawertile(context, "Log Out", Icons.logout)),
        ],
      ),
    );
  }
}

Widget buildrawertile(BuildContext context, String title, IconData titleIc) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    //  color: Colors.brown.shade100,
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium,
        ),
        Icon(titleIc)
      ],
    ),
  );
}
