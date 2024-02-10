import 'package:admin_panel/controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Amjad Brand'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: ctrl.productList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        // Use the actual product data from the controller
                        final product = ctrl.productList[index];

                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      product.productImageUrl,
                                      height: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        product.productPrice,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ListTile(
//                           title: Text(product.productName),
//                           subtitle: Text(product.productDesc),
//                           trailing: IconButton(
//                             onPressed: () {
//                               // Implement delete functionality
//                               // You may call a delete method from the controller
//                               // and update the product list accordingly
//                               ctrl.deleteProduct(index);
//                             },
//                             icon: const Icon(Icons.delete),
//                           ),
//                           // leading: CircleAvatar(
//                           //   child: Image.network(product.productImageUrl),
//                           // ),
//                         );