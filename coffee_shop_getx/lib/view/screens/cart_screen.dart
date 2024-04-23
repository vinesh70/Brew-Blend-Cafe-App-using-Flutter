import 'package:coffee_shop_get/consts/global_constants.dart';
import 'package:coffee_shop_get/view/widgets/cartitem_card_widget.dart';
import 'package:coffee_shop_get/view/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  late CartController controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller = Get.find<CartController>();
    // OrderController _ordercontroller = Get.put(OrderController());
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: homescafold_color,
      drawerScrimColor: Colors.black54,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: appbartitle_color,
        title: const Text("Your Cart"),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(
            Icons.sort,
            size: 35.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Obx(
              () =>
          controller.cart.isEmpty
              ? const Center(
            child: Text("Your cart is empty"),
          )
              : Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.cart.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        drink: controller.cart[index],
                        index: index,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Grand Total : \Rs. ${NumberFormat.currency(
                          decimalDigits: 0,
                          symbol: '',
                        ).format(
                          controller.grandTotal.value,
                        )}",
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _confirmationDialog();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: authbackcolor),
                        child: const Center(
                          child: Text(
                            "Proceed",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _confirmationDialog() {
    Get.defaultDialog(
      title: "Really want to proceed ?",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            onPressed: () {
              controller.transactionCompleted();
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.black),
            ))
      ],
      backgroundColor: const Color(0xff4D4D4D),
      titleStyle: const TextStyle(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: ListView.separated(
              separatorBuilder: (_, i) => const Divider(),
              itemCount: controller.cart.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(controller.cart[index].icon))),
                  ),
                  title: Text(
                    controller.cart[index].name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  subtitle: Text(
                    "\Rs. ${NumberFormat.currency(decimalDigits: 0, symbol: '')
                            .format(controller.cart[index].price)} x ${controller.cart[index].qty}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            controller.userSession["name"],
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            controller.userSession["email"],
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Total \Rs. ${NumberFormat.currency(decimalDigits: 0, symbol: '')
                    .format(controller.grandTotal.value)}",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}
