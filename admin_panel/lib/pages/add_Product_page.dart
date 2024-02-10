import 'package:admin_panel/utils/Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AddProductForSell extends StatelessWidget {
  const AddProductForSell({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add product for sell"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Add new item's and start selling ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: ctrl.productNameCtrl,
                    decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.production_quantity_limits_sharp),
                        border: OutlineInputBorder(),
                        hintText: "Product name "),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: ctrl.productDescCtrl,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Product Discreption "),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: ctrl.productImageUrlCtrl,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.image),
                        border: OutlineInputBorder(),
                        hintText: "Product image url "),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: ctrl.productPriceCtrl,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.money_rounded),
                        border: OutlineInputBorder(),
                        hintText: "Product price "),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        ctrl.addProduct();
                      },
                      child: Button(title: 'Submit'))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
