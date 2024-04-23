import 'package:coffee_shop_get/controllers/order_controller.dart';
import 'package:coffee_shop_get/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/app_constants.dart';
import '../../consts/global_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late MySearchController _controller;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller = Get.find<MySearchController>();
    OrderController ordercontroller = Get.put(OrderController());
    return Scaffold(
        backgroundColor: homescafold_color,
        appBar: AppBar(
          backgroundColor: appbartitle_color,
          actions: [
            GestureDetector(
              onTap: () => Get.offAllNamed(Appconstants.homeroute),
              child: const Padding(
                padding:
                EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
                child: Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            )
          ],
          title: Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                        border: InputBorder.none,
                      ),
                      onSubmitted: (searchedvalue) {
                        setState(() {
                          searchedvalue =
                              _textEditingController.text.toString().trim();
                          _controller.getsearchedlist(searchedvalue);
                          print(_controller.searchedfordrinks.first.name
                              .toString());
                        });
                      },
                    )),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                kSizedBox,
                _controller.searchedfordrinks.isEmpty
                    ? const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 58.0, vertical: 200),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : SizedBox(
                  height: MediaQuery
                      .sizeOf(context)
                      .height,
                  child: ListView.separated(
                    itemBuilder: (ctx, i) =>
                        ListTile(
                          onTap: () {
                            ordercontroller.getCoffeeArgs(
                                _controller.searchedfordrinks[i]);
                            Get.toNamed(Appconstants.orderroute);
                          },
                          title: Text(
                            _controller.searchedfordrinks[i].name,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              fontSize: 24.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                          subtitle: Text(
                            '\Rs ${_controller.searchedfordrinks[i].price
                                .toString()}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Text(
                              '${i + 1}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: _controller.searchedfordrinks.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
