import 'package:customer_list/services/customer_api_service.dart';
import 'package:customer_list/utils/colors.dart';
import 'package:customer_list/views/product_details/customer_details.dart';
import 'package:customer_list/widgets/custom_paginator_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Customer List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: controller.customers.length,
              itemBuilder: (_, index) {
                final customer = controller.customers[index];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: customer.imagePath != null
                          ? NetworkImage(
                              "https://www.pqstec.com/InvoiceApps/${customer.imagePath}")
                          : const AssetImage("assets/images/profile2.png")
                              as ImageProvider,
                    ),
                    title: Text(
                      customer.name ?? 'No Name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      customer.phone != null
                          ? "📞 ${customer.phone}"
                          : "Phone: N/A",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Text(
                      '৳ ${customer.totalDue?.toStringAsFixed(2) ?? '0.00'}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => CustomerDetails(customer: customer));
                    },
                  ),
                );
              },
            )),
            Obx(() => NumberPaginator(
                  numberPages: controller.totalPages.value,
                  initialPage: controller.currentPage.value,
                  onPageChange: (int pageNumber) {
                    controller.fetchCustomers(page: pageNumber);
                    controller.currentPage.value = pageNumber;
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        const PrevButton(),
                        Flexible(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                controller.totalPages.value,
                                (index) => CustomPaginatorButton(
                                  onTap: () {
                                    controller.fetchCustomers(page: index);
                                    controller.currentPage.value = index;
                                  },
                                  text: '${index + 1}',
                                  isSelected:
                                      index == controller.currentPage.value,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const NextButton(),
                      ],
                    ),
                  ),
                ))
          ],
        );
      }),
    );
  }
}
